# Enforcing Almost-Sure Reachability in POMDPs

This is the supplementary material for:

Enforcing Almost-sure Reachability in POMDPs by Sebastian Junges, Nils Jansen and Sanjit A. Seshia. CAV 2021.

## Content
- Videos with shielded and unshielded agents moving randomly through our 6x2 test domains.
- Details about the models, and the model files describing the POMDPs
- Scripts to rerun the experiments (and the pre-computed winning regions when one only wants to create more videos)
- A docker container with the following software:
    - [Storm](https://github.com/sjunges/storm/tree/almostsurebdd) (in a to-be-merged version), see `/opt/storm`
    - [Stormpy](https://github.com/sjunges/stormpy/tree/almostsurepomdp) (in a to-be-merged version), see `/opt/stormpy`
    - [Gridstorm](https://github.com/sjunges/gridworld-by-storm), a small library for visualising gridworlds, see `/opt/gridworld`
    - [RLShield](https://github.com/sjunges/shield-in-action), a prototype to shield an agent with the computed winning regions, see `/opt/rlshield` 
    
## Using a Docker container

We provide a docker container. We assume you have [docker installed](https://docs.docker.com/get-docker/). Then, run:

```
docker pull sjunges/shieldingpomdps:cav21
```
or in case you downloaded this container from an (unpacked) archive:
```
docker load -i shieldingpomdps_container.tar
```

The container is based on an container for RLShield and ultimately based on the Docker for the probabilistic model checker as provided by the Storm developers, for details, 
see [this documentation](https://www.stormchecker.org/documentation/obtain-storm/docker.html).

The following command will run the docker container (for Windows platforms, please see the documentation from the storm website).
```
docker run --mount type=bind,source="$(pwd)",target=/data -w /opt/experiments -it --name shieldingpomdps sjunges/shieldingpomds:cav21
```
Files that one copies into `/data` are available on the host system in the current working directory. 

You will see a prompt inside the docker container. The README in this folder is what you are reading. 
    
**Note** The docker will may pose problems on Mac M1 silicon. Please consider setting the platform to amd64.

## Computing Winning Policies
We first discuss how to compute winning policies and winning regions. 

### Computing almost-sure reachability

We provide three scripts.
Each of the scripts is expected to take 2 hours. 
To speed up, feel free to reduce the TO in those scripts (the 900 seconds in the arguments below)

The scripts write logfiles into `logfiles/iterative`, `logfiles/oneshot`, `logfiles/belsupmc`
After running these scripts, one can create a table like [1, Table 1].

#### Iterative method (main contribution)
This script runs the iterative method in two configurations, see [1].

```
./winning-region-computations.sh /opt/storm/build /opt/gridstorm/gridstorm/models/files/ 900
```

This script additionally stores the winning regions in `winningregion` as they are used for the analysis of the shielding agent.

#### One-shot method
This script runs the one-shot method in two configurations, see [1].

```
./one-shot-computations.sh /opt/storm/build /opt/gridstorm/gridstorm/models/files/ 900
```

#### Belief-support MDP model checking

This script runs the belief-support MDP model checking as outlined in [1, Section 5].
```
./belsupmdp.sh /opt/storm/build /opt/gridstorm/gridstorm/models/files/ 900
```

#### Creating a table.
Table 1 summarizes computational effort for computing the winning region. 

```
python create_table.py -l logfiles/ --csv-output table1.csv
```

Note, the logfiles in logs/iterative reflect the entries in the table for 'iterative'. 
The computation of the winning regions was done separately due to the computational overhead (the problem of computing their size is #P-hard).
This can be enabled by adding the option `--pomdpQualitative:allstats` (but induces a run time penalty).

### Running the code on different examples

The code can run on general POMDPs in the format storm supports for POMDPs.


### Sources
We attached a version of storm that includes our changes:
The major changes to storm  are the addition of (almost all) code in the src/storm-pomdp/analysis folder.
In particular: 
- The iterative method can be found in `src/storm-pomdp/analysis/IterativePolicySearch.{h,cpp}`.
- The code for one-shot generation is in `src/storm-pomdp/analysis/OneShotPolicySearch.{h,cpp}`.
- The code for the graph-preprocessing is in `src/storm-pomdp/analysis/QualitativeAnalysisOnGraphs.{h,cpp}`.
- The code for creating the belief-support-MDP encoding is in `src/storm-pomdp`
- The entry point is located in src/storm-pomdp-cli/storm-pomdp.cli, more precisely in the function performQualitativeAnalysis  on line 143. 

The code will be part of Storm 1.7.0

## Shielding, Simulation and videos

### Models
All models describe NxN grids. 
The models are defined in the prism format and can be found in `/opt/gridworld/models/files/`

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
    
    
### Videos
The videos are in the `videos` folder of the docker and can be copied to the host machine by copying:
```
cp -r videos /data
```

#### Simulation set-up
We provide videos of the shielded and unshielded agents.
The agent, in every step, selects uniformly random an available action that is within the shield. 
The agent does thus not have any particular goal in mind.
The outcome of the actions, and the movements of the adversaries are according to the POMDP dynamics,
see below for more details about the models.

#### Things to watch
Rather than observing the behavior of the ego, which is random, we recommend to look at the following:

- Unshielded, the agent may violate the specification, e.g., by reaching an avoid state.
- Shielding with the winning region for the initial state often prevents harmless actions, it is not very permissive.
- Shielding with the fixpoint of the winning region search is more permissive.

#### Video layout

On the top right, the location of all agents is given, and in the right bottom, the step-count.

##### Grid

The ego is in blue. A lighter shade of blue gives all cells in the current belief support.
The arrows indicate movements in the grid (to ease watching). Other actions are only available on the right.
A blue, circle hatched area indicates the view area.

Adversaries are brown. If their state extends to a direction, they are represented by a triangle.
The states that the adversaries are believed to be in is marked in purple.
A red dashed line may mark the limit for the adversaries. A red hatched region marks the region observed by the adversaries (in Avoid). 

Red cells are avoid states, green cells are reach states (light green shades indicate areas where a goal action leading to reach states can be taken). Yellow states reflect (static) landmarks such as recharging stations, whereas (dynamic) landmarks with a status are depicted as polygons (with an identifier and information about their status).

##### Actions
Action selection is visible on the right.
Actions not available in a state are grayed out. 
Actions disallowed by the shield are in red.
The selected action is highlighted green.
We recommend to pause and step through the frames of the video for closer inspection. 

#### Highlighted videos:

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

#### More videos
In videos/all, you can find all videos that we generated. To be precise, we used a fixed seed (for reproducibility) and for every benchmark and shield-modus, we rendered the first 5 traces
that terminated within a fixed amount of steps (default 150): Termination either means that we reached a reach or an avoid state. For the shielded runs, we never visit an avoid state, as our shield is correct by construction.
We filter the runs to those that terminate in reasonable time as they are more informative.

### Running experiments

We can create additional videos from the precomputed winning regions:
```
./simulate-with-shield.sh /opt/rlshield precomputed_winningregions/ 1 10
```
This will create 1 video per benchmark and use the precomputed shields in `precomputed_winningregions/`.
It will create stats (the avg available actions) based on running 10 episodes.
For the patient, you can create more videos by increasing `1`, or create more significant stats using more runs by increasing `10`.

If `winning-region-computations.sh` (see above) has been executed, one can also use the winning regions `winningregion` from those runs. 
Logfiles are written to 'logfiles/rendering' and stats collected are written to `stats`. 


To evaluate the number of actions that the shield allows, 
run 

```
python summarize_stats.py
```


## Further usage examples

- To invoke storm, see the shell scripts.  Storm will run on other POMDP instances, e.g.:
```
/opt/storm/build/bin/storm-pomdp --prism /opt/rlshield/examples/maze2.prism --prop "Pmax=? [\!\"bad\" U \"goal\"]" --qualitative-analysis -const "sl=0.3" --memlesssearch iterative
```

- To run RLShield with different benchmarks, see the `README.md` in `/opt/rlshield` for more information. 
On other benchmarks, there will be no visualizations possible, but the shielding will run as expected.
