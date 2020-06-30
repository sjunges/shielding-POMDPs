 #!/bin/bash         
# Pass the location in which storm is found:
echo "Storm build folder is assumed to be found at: $1"
STORM_BUILD_DIR="$1"
STORM_POMDP="${STORM_BUILD_DIR}/bin/storm-pomdp"
echo "Storm-binary: $STORM_POMDP"

echo "Models expected at folder $2"
MODEL_DIR=$2

TO="900" 
echo "Time out is $TO seconds"
TIMEOUTCOMMAND="timeout $TO"

# Obstacle
# echo "Running obstacle benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "obstacle-6-initial.wr" --logfile obstacle-6-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "obstacle-6-fixpoint.wr" --logfile obstacle-6-fixpoint.log --winningregion
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=8 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "obstacle-8-initial.wr" --logfile obstacle-8-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=8 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "obstacle-8-fixpoint.wr" --logfile obstacle-8-fixpoint.log --winningregion
# # Intercept
# echo "Running intercept benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "intercept-7-1-initial.wr" --logfile intercept-7-1-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "intercept-7-1-fixpoint.wr" --logfile intercept-7-1-fixpoint.log --winningregion 
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "intercept-7-2-initial.wr" --logfile intercept-7-2-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "intercept-7-2-fixpoint.wr" --logfile intercept-7-2-fixpoint.log --winningregion 
# Avoid
echo "Running avoid benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "avoid-6-3-initial.wr" --logfile avoid-6-3-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "avoid-6-3-fixpoint.wr" --logfile avoid-6-3-fixpoint.log --winningregion 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "avoid-7-4-initial.wr" --logfile avoid-7-4-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "avoid-7-4-fixpoint.wr" --logfile avoid-7-4-fixpoint.log --winningregion 
# Evade
# echo "Running evade benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "evade-6-2-initial.wr" --logfile evade-6-2-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "evade-6-2-fixpoint.wr" --logfile evade-6-2-fixpoint.log --winningregion 
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "evade-7-2-initial.wr" --logfile evade-7-2-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "evade-7-2-fixpoint.wr" --logfile evade-7-2-fixpoint.log --winningregion 
# # Refuel
# echo "Running refuel benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "refuel-6-8-initial.wr" --logfile refuel-6-8-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "refuel-6-8-fixpoint.wr" --logfile refuel-6-8-fixpoint.log --winningregion
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "refuel-7-7-initial.wr" --logfile refuel-7-7-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "refuel-7-7-fixpoint.wr" --logfile refuel-7-7-fixpoint.log --winningregion
# # RockSample
# echo "Running rocks benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "rocks-4-initial.wr" --logfile rocks-4-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "rocks-4-fixpoint.wr" --logfile rocks-4-fixpoint.log --winningregion
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "rocks-6-initial.wr" --logfile rocks-6-initial.log
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --verbose --exportwinningregion "rocks-6-fixpoint.wr" --logfile rocks-6-fixpoint.log --winningregion
