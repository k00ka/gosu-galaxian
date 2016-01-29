# gosu-galaxian
## Project for the speed sprint workshop [first presented at Toronto Ruby Hack Night, January 28, 2016]

This project, based on the RubyManor project by Belén Albeza, has been selected to be a part of the speed-sprint workshop.
The speed-sprint project can be found here: https://github.com/k00ka/speed-sprint.

# User Stories
1. block pattern of enemies + levels + scoring

  The enemies are too disorderly. Make the enemies move as a large group (think *Galaxian* or *Space Invaders*). After you kill this block, a new block should appear. The user should also get a scoring bonus with each block cleared.

Team 3
-we added the concept of squads of aliens and added bonus points if the entire squad is killed
-to be done by our partners: logic for initializing the squadrons

2. diving two at a time

  The user should see 2 enemies dive off from the main block and fall to the bottom of the window. The user should die if he collides with a falling enemy. Enemies that fall off screen should return to their block.

  Team 1: Aliens currently dive ONE at a time. The Galaxian.update method calls Galaxian.release_alien. Each call has a 1/500 chance of releasing the alien from the squadron, effectively doubling its vertical speed and adding horizontal motion. Try to make this move two at a time instead of just one. 

3. sound (shots, collisions, movement, diving)

  We need some SFX to jazz this game up! Use some fun sounds for various game events.

4. increased speed and frequency of diving

  The game needs to get more challenging. More diving enemies, more frequently, more more more! Maybe diving enemies could drop some bombs as they fall as well.

# TEAM 3
1. Allowed Alien class initializer to accept an x position for spawning aliens.
2. Implemented AlienSquadron which will spawn one alien at one of five random positions.

# To-Do
1. Allow groups of aliens to spawn in blocks at a fixed location.
2. Don't spawn a new group until the old one is destroyed.

[Team 5]
Add new speed addition so aliens fall down faster as more points get added