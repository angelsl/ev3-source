#include <stdio.h>
#include <stdlib.h>

#include <lwan.h>

#define BEFORE_SECRET                                                                              \
  "<!DOCTYPE html><title>EV3 Device Panel</title><style>input { width: 50%; }</style>Your device " \
  "secret is: <input readonly value='"
#define AFTER_SECRET "'>"

static const char *secret_path;

static char *secret;
static size_t secret_bufsize;

LWAN_HANDLER(index) {
  FILE *f = fopen(secret_path, "r");
  if (!f) {
    perror("fopen");
    goto fail;
  }

  ssize_t sz = getline(&secret, &secret_bufsize, f);
  if (sz == -1) {
    perror("getline");
    goto fail;
  }

  fclose(f);
  secret[sz - 1] = '\0';

  response->mime_type = "text/html";
  lwan_strbuf_printf(response->buffer, "%s%s%s", BEFORE_SECRET, secret, AFTER_SECRET);
  return HTTP_OK;

fail:
  response->mime_type = "text/plain";
  lwan_strbuf_set_staticz(response->buffer, "Error retrieving secret");
  return HTTP_INTERNAL_ERROR;
}

int main(void) {
  secret_path = getenv("PANEL_SECRET_PATH");
  if (!secret_path) {
    secret_path = "/var/lib/sling/secret";
  }

  char *bind = getenv("PANEL_BIND");
  if (!bind) {
    bind = "0.0.0.0:80";
  }

  const struct lwan_url_map default_map[] = {
      {.prefix = "/", .handler = LWAN_HANDLER_REF(index)}, {.prefix = NULL}};

  struct lwan_config config = *lwan_get_default_config();
  config.listener = bind;
  config.n_threads = 1;
  struct lwan l;

  lwan_init_with_config(&l, &config);

  lwan_set_url_map(&l, default_map);
  lwan_main_loop(&l);

  lwan_shutdown(&l);

  return 0;
}
