#!/bin/bash

if ! grep -qs '# ADD-SLING-PANEL' CMakeLists.txt; then
  cat <<'EOF' >> CMakeLists.txt
# ADD-SLING-PANEL
add_executable(panel
  ../panel.c
)

target_compile_options(panel
  PRIVATE -Wall -Wextra -Wswitch-enum -std=gnu11 -Werror -fwrapv -g
  PRIVATE -D_GNU_SOURCE -D_POSIX_C_SOURCE=200809L
  PRIVATE $<$<CONFIG:Debug>:-Og>
  PRIVATE $<$<CONFIG:Release>:-O2>
)

target_link_libraries(panel ${LWAN_COMMON_LIBS} ${ADDITIONAL_LIBRARIES})
EOF
fi

# FIXME https://github.com/lpereira/lwan/issues/293
# We don't use WebSockets so it's fine..
sed -i 's#static_assert#// static_assert#g' src/lib/lwan-websocket.c
