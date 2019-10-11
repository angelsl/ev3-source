# Sumobot 2019 Rules

The _(tentative)_ sequence of events are as follows:

|      Time     |          Event        |
|:-------------:|:---------------------:|
| 17:30 - 18:00 | Registration          |
| 18:00 - 18:15 | Introduction          |
| 18:15 - 19:15 | Sumobot Stage 1A      |
| 19:15 - 19:35 | Tea Break             |
| 19:35 - 20:30 | Sumobot Stage 1B      |
| concurrently  | "Robots Got Talent"   |
| 20:30 - 21:00 | Sumobot Finals        |
| 21:00 - 21:15 | Trivia Contest Finals |
| 21:15 - 21:30 | Prize presentations   |

## Rules and Regulations

### Team Registration

Rearrangement of team members within each Studio is allowed. Your team for this contest does not have to be the same as the one for the robot mission. Each team may have 3, 4 or 5 members only.

Similar to the robot mission, please follow the **No-Sponge Rule**: _in intra-team collaboration where the group, as a whole, produces a single product, each member of the team must actively contribute._

### Playing Field

The Dohyō will be a circle with diameter of 140 cm, with 7 concentric circles with different colors (magenta, blue, cyan, green, yellow, red and white) painted on it as illustrated by the image below. The Dohyō will be elevated about 20cm above the ground.

![dohyo](https://s3-ap-southeast-1.amazonaws.com/mission-assets/contests/dohyo.jpg)

### Robot Specifications

Contesting robots are required to follow these constraints:

- Only parts from one LEGO EV3 set (core set + extension set) will be allowed on the robots. There are no other limits on robot size.
- Robots must run autonomously once started. There should not be remote control of any kind in battle.

Because the Source engine takes about 10 seconds to load on the EV3, you are advised to make your robot program pre-loadable: upon startup, it should give some indication when it is ready, and only start upon a button press or other suitable input. This will let your robot start immediately upon the referee's starting signal, without risking a false start.

[See here for a guide on this.](#appendix-button-controlled-start)

### Match

Each match will consist of a number of games, depending on the stage of the tournament:

- For the First Stage: each match has one game. The winning team earns three points and the losing team no points. Each team earns one point for a tie.
- For the Quarter and Semi-final Stages: each match has up to 7 games. The first team to win 3 games will win this match. If there is no winner after 7 games, the referee will use coin flipping to break the tie.
- For the Final Stage: each match has up to 9 games. The first team to win 3 games will win this match. If there is no winner after 9 games, the referee will claim both teams as the winner.

### Game

- Before the start of each game, the two robots will both be placed at one of the starting positions as stated [in this section](#starting-positions-of-robots), which will be chosen by the referee.
- The robots may not move until the referee gives the starting signal.
- The game ends when one of the robots has been defeated.

A robot is deemed to be defeated when it, or any part thereof, touches the ground. The other robot is the winner of the game.

If both robots touch the ground in quick succession, the referee will decide which one was first or call a tie. Each game has a **time limit of 60 seconds**. If both robots are still on the Dohyō after this time limit, the game is a tie.

### Starting positions of robots

In each game, the two robots will be initially placed in one of the following positions randomly.

1. The two robots are facing each other head-on
1. The two robots are facing away from each other
1. The two robots are parallel to each other.
1. The two robots are anti-parallel to each other.
1. The two robots are perpendicular to each other.

Refer to the diagrams below.

1. ![head-on](sp/1.svg)

1. ![away](sp/2.svg)

1. ![parallel](sp/3.svg)

1. ![anti-parallel](sp/4.svg)

1. ![perpendicular](sp/5.svg)

## Tournament format

### First Stage

In the First Stage, we will have individual single matches between randomly selected contestants. We calculate the average point score for each team, from their matches: 3 points for a win, 1 point for a draw, 0 points for a loss. So if a team wins three and draws two matches, the score will be (3 * 3 + 2 * 1) / 5 = 2.2. The 8 teams with the highest score will make it into the quarter-final stage. If there are multiple teams with the same score, we draw lots.

### Quarter-final Stage

8 teams will enter the Quarter-final Stage. We will have 4 groups, each consisting of 2 teams. In each group, there will only be one match. The four winning teams will proceed to the semi-final stage.

### Semi-final Stage

4 teams will enter the Semi-final Stage. We will have 2 groups, each consisting of 2 teams. In each group, there will only be one match. The two winning teams will proceed to the final stage.

### Final Stage

2 teams will enter the Final Stage. There will be only one match between them. If there is a tie, both teams will become the winners. The winning team(s) will be the overall winner(s) of the tournament.

## XP Awards

Depending on the stage until which your team participates in the tournament, different amounts of XP will be awarded. Every member who has **actively** contributed in the team will be awarded the same amount of XP.

|        Stage      |  XP  |
|:-----------------:|:----:|
| Every participant | 600  |
| Top 8 teams       | 1200 |
| Top 4 teams       | 1600 |
| Top 2 teams       | 2000 |
| Champion          | 3000 |

Note: to be considered as a participant of the tournament, you and your team must register at the counter before the tournament starts, and participate in the First Stage according to the match assignment, which will be published before the tournament. Please remember to bring your student card for identification purposes. More details will be available on the day of the tournament.

## Appendix: Button-controlled start

Because our Source engine takes about 10 seconds to start, you are advised to run your program before the game actually starts, so that your robot is not stuck loading after the game starts. Here is one way to do it.

Insert this at the start of your program, after any initialisation is done:

```js
display("Loaded!");
ev3_playSequence([500, 500, 0]);
ev3_waitForButtonPress();
```

This causes your robot to show "Loaded!" on screen, beep, and wait for a button press once it is loaded. When the referee gives the starting signal, you can then press a button on the robot to let your robot start.
