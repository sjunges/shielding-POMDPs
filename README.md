# Enforcing Almost-Sure Reachability in POMDPs

This is the supplementary material for the technical report on enforcing almost-sure reachability in POMDPs.

## Content
- Videos with shielded and unshielded agents moving randomly through our 6x2 test domains.
- Details about the models, and the model files describing the POMDPs
- Scripts to rerun the experiments (and the pre-computed winning regions when one only wants to create more videos)
- Log files for the precomputed winning regions, and log files for the precomputed videos.

## Videos
 

### Simulation set-up
We provide videos of the shielded and unshielded agents.
The agent, in every step, selects uniformly random an available action that is within the shield. 
The agent does thus not have any particular goal in mind.
The outcome of the actions, and the movements of the adversaries are according to the POMDP dynamics,
see below for more details about the models.

### Things to watch
Rather than observing the behavior of the ego, which is random, we recommend to look at the following:

- Unshielded, the agent may violate the specification, e.g., by reaching an avoid state.
- Shielding with the winning region for the initial state often prevents harmless actions, it is not very permissive.
- Shielding with the fixpoint of the winning region search is more permissive.

### Video layout

On the top right, the location of all agents is given, and in the right bottom, the step-count.

#### Grid

The ego is in blue. A lighter shade of blue gives all cells in the current belief support.
The arrows indicate movements in the grid (to ease watching). Other actions are only available on the right.
A blue, circle hatched area indicates the view area.


Adversaries are brown. If their state extends to a direction, they are represented by a triangle.
The states that the adversaries are believed to be in is marked in purple.
A red dashed line may mark the limit for the adversaries. A red hatched region marks the region observed by the adversaries (in Avoid). 

Red cells are avoid states, green cells are reach states (light green shades indicate areas where a goal action leading to reach states can be taken). Yellow states reflect (static) landmarks such as recharging stations, whereas (dynamic) landmarks with a status are depicted as polygons (with an identifier and information about their status).

#### Actions
Action selection is visible on the right.
Actions not available in a state are grayed out. 
Actions disallowed by the shield are in red.
The selected action is highlighted green.
We recommend to pause and step through the frames of the video for closer inspection. 

### Highlighted videos:

- In the videos folder, open HIGHLIGHT-01-avoid-6-3-fixpoint-1.mp4. 
  - The agent is immediately restricted not to go south. After one more movement of the adversary (frame 4), it is clear why: the agent would have been detected.
  - In frame 12, the agent gets the freedom to move south. Going south (frame 14 -> frame 15) is essential to reduce the uncertainty about the second adversary. 
  - In frame 16, going further south is prevented. It may not make it back in time.
  - Frame 28 shows another situation that is not immediately dangerous.
  - Frame 40 is a perfect moment to go south: We discover that both adversaries are moving west, giving ample time to make the crossing. Notice that in frame 46, turning around is longer possible.
- Now open HIGHLIGHT-02-avoid-6-3-initial-1.mp4
  - In Frame 8,10,12,...., the shield disallows a harmless (but not very smart) move west.
  - In Frame 18, the shield allows a smart move east.
  - In frame 24, the shield enforces going west, where a south may have been feasible, and a move east also would be better.
  - In frame 28, the shield again prevents going east.
  - In frame 95, timing is good, and the shield allows going south. Finally, the agent arrives safely -- this is not a suprise -- after all, the agent was shielded.

- We consider another scenario: In the videos folder, open HIGHLIGHT-03-rocks-6-fixpoint-2.mp4. 

  - Observe that the agent is free to roam. 
  - In frame 11, the shield is activated for the first time:
  Why? Because the current belief support includes being two fields above of the rock nr 2. Going south here leads to going     south either one or two fields, and the agent does yet know whether the rock is good or bad (indicated by the questionmark).
  - In frame 44, the shield prevents the finish action in the goal area, we have not yet collected the good rock.
  - In frame 75, it has found that the rock 2 is a good rock. From now on, we can visit this field. Indeed, no action is shielded currently.
  - In frame 82, one can see that visiting rock 1 is still unsafe.
  - In frame 93, we collect the rock (see frame 94). 
  - We can than safely execute the finish action in frame 139, and do so in frame 140.
- In the videos folder, open HIGHLIGHT-04-rocks-6-initial-3.mp4
  - Observe that immediately, the shield prevents going east.
  - Indeed, the agent is forced to stay on the x=0 column for quite some time.
  - Only once both rocks are known to be bad, the leftmost column can be left. Notice that now, the agent gets quite some freedom. Here, the graph-preprocessing has helped in finding lots of winning beliefs.
  
  We want to emphasise that the restricted policy is not necessarily bad, but it is needlessly restrictive. 
- If one wonders whether shielding is necessary, we encourage looking e.g., all/rocks-6-noshield-0.mp4.

- We liked also watching HIGHLIGHTS-05-refuel-7-7-fixpoint-1.mp4 and HIGHLIGHTS-06-evade-6-2-fixpoint-1.mp4. We encourage you to make your own observations.

### More videos
In videos/all, you can find all videos that we generated. To be precise, we used a fixed seed (for reproducability) and for every benchmark and shield-modus, we rendered the first 5 traces
that terminated within 150 steps: Termination either means that we reached a reach or an avoid state. For the shielded runs, we never visit an avoid state, as our shield is correct by construction.
We filter the runs to those that terminate in reasonable time as they are more informative.

## Binaries

We plan to release a Docker-container with all binaries soon.

## Source code

### Winning region computation

The release 1.6.0  of storm includes all our changes. The major changes are the addition of (almost all) code in the src/storm-pomdp/analysis folder.
In particular: 
- The iterative method can be found in src/storm-pomdp/analysis/IterativePolicySearch.{h,cpp}.
- The code for one-shot generation is in src/storm-pomdp/analysis/OneShotPolicySearch.{h,cpp}
- The code for the graph-preprocessing is in src/storm-pomdp/analysis/QualitativeAnalysisOnGraphs.{h,cpp}.
- The entry point is located in src/storm-pomdp-cli/storm-pomdp.cli, more precisely in the function performQualitativeAnalysis  on line 143. 

### Shielding, Simulation and videos

We wrote a small tool that allows for simulating and shielding, found in the shield-in-action folder. The heavy lifting in this code (if any) is tracking the belief support MDP state (without constructing the MDP explicitly).
The code is actually implemented within storm, in src/storm-pomdp/generator/BeliefSupportTracker.{h,cpp}. 

We plan to publish the remaining sources soon.

## Models

### Description
All models describe NxN grids.

#### Evade
In this example, our robot needs to arrive at a destination (bottom right) without being intercepted by a faster agent. The top row is only accessible by the robot, which also has a limited view radius $R$, but can instead of moving scan the full grid to disclose the current position of the agent.

#### Avoid
A variant of Evade: our robot needs to reach a target area (bottom of the grid). 
It needs to remain undetected (keep a distance) by two moving agents, but may exploit that the agents  patrol certain preset routes. Their speed is uncertain, so their position along the patrolled area is unknown unless within the view radius. 

#### Intercept
The 'inverse' problem to Evade. Our robot moves in 8 directions, has a limited view radius $R$, and via cameras observes  a west-to-east corridor in the center of the grid. Our robot wants to meet an agent moving in four directions, before that agent leaves the area via two exits at the west corners. Cameras observe

#### Obstacle
Obstacle is a grid with known static obstacles where the robot needs to find the exit. Its initial state and movement are uncertain, and it only observes whether the current position is a trap or exit. 

#### Rocks
Rocks adapts obstacle: Rather than obstacles, the grid contains 2 rocks, which are either valuable or dangerous to collect. To find out with certainty, the rock has to be sampled from some adjacent field. The goal is to collect at least one valuable rock (if a valuable rock is in the grid) and bring it to the drop-off zone. No dangerous rocks should be collected.

#### Refuel
Our rover needs to travel from A (upper-left corner) to B (lower-right corner), while avoiding an obstacle on the diagonal between A and B. 
The rover may detect the edges of the grid, but does not know its exact position. 
The rover can move in any of the 4 cardinal directions, but the distance travelled is uncertain. Every action costs energy. Therefore, the rover must recharge to E energy at recharging stations (in this instance also at the diagonal between A and B).

## Log files

The logfiles in logs/iterative reflect the entries in the table for 'iterative'. 
The computation of the winning regions was done seperately due to the computational overhead (the problem of computing their size is #P-hard).
This can be enabled by adding the option --pomdpQualitative:allstats (but induces a run time penalty).
The logfiles in logs/one-shot reflects the entries in the table, as well as some failed attempts with different parameter values.
The logfiles in logs/simulations contain logs for the video creation. We added them for completeness, but they do provide little insight.
