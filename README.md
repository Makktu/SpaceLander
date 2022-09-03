# SpaceLander

#### "Design Document" of a kind:

The elevator pitch: Guide a spaceship in zero-g using reaction thrusters only to explore a mysterious cosmic Megastructure.


- The Spacecraft should handle just as a real 100-ton spacecraft would, with true space physics, in which momentum and inertia are key for navigating through the often tight spaces of the Megastructure.

The controls are:

Top Thruster (UP)
Left Thruster (LEFT)
Right Thruster (RIGHT)
Bottom Thruster (DOWN)

NB: the thrusters exert force in the relevant direction, i.e. moving the SpaceLander in the opposite direction: UP moves the craft down, LEFT moves it right, RIGHT moves it left, and DOWN moves it up. This quickly becomes intuitive and natural in-game without the need for special instructions.

- No pickups or powerups of any kind. No real puzzles. The game consists entirely of manouevring the craft through the Megastructure to the 'goal' (TBD).

No part of the Megastructure is randomly generated. All designed by hand.

Several distinct levels which are travelled between via portals.

Once the thrusters are mastered the game can be completed in several minutes. It should take considerably longer than that to get to grips with the movement of the SpaceLander, though.

This is achieved primarily by this factor:

##### A single collision with **any** environmental object is the end of the game.

No checkpoints, saves, or waystations. Game over is game over.

Many tight spaces will require the player to slow almost to a stop in order to navigate through using the thrusters.

The player starts with a finite amount of FUEL, which is displayed clearly on-screen at all times. Use of thrusters burns a set amount of fuel per second. When it is depleted, the game is over.

- There should be just enough fuel to complete the game. Refuelling stations exist scattered through the Megastructure.

Difficulty level: hard, bordering on impossible. The player will have to learn to be exceptionally disciplined with fuel expenditure. This is only learned after many failures.

ENEMIES: none. The Megastructure is the only obstacle between the player and the goal.

HAZARDS: Laser beams. Laser 'curtains'. Gravity chambers that distort how gravity operates. Etc.

Other features: an eerie atmosphere, as if the player is exploring an abandoned tomb. A pervasive sense of menace. 

End goal: to reach the end, land the SpaceLander, and uncover the secret of the Megastructure. Which is...? (TBD)


### To Do

- MOVEMENT. Nothing else matters as much as this being right. Movement must be real-universe physics, and must be perfect. No concession whatsoever to the 'it's only a game' mentality. I.e. the SpaceLander should handle as if it's from a flight sim.
- Settle on a coherent gameplay loop and work towards it. (Good balance between natural environmental obstacles, such as walls and towers etc., and the 'laser beam of death' type obstacles.)
- Some PROPER level design. At the moment it is still just a random prototype environment. Sketch of the world, not the world.
- Better Start screen. ✅ (Although need to add game credits, e.g. for music, etc.)
- Pause screen. ✅ (Needs cosmetic buff, but is essentially in place.)
