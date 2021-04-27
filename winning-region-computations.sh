 #!/bin/bash         

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 STORMBUILDDIR MODELSDIR TO" >&2
  exit 1
fi
if ! [ -e "$1" ]; then
  echo "$1 not found" >&2
  exit 1
fi
if ! [ -d "$1" ]; then
  echo "$1 not a directory" >&2
  exit 1
fi
if ! [ -e "$2" ]; then
  echo "$2 not found" >&2
  exit 1
fi
if ! [ -d "$2" ]; then
  echo "$2 not a directory" >&2
  exit 1
fi

if ! [ -e "logfiles/iterative" ]; then
  echo "logfiles/iterative not found. Please create directory" >&2
  exit 1
fi

if ! [ -e "winningregion" ]; then
  echo "winningregion not found. Please create directory" >&2
  exit 1
fi

# Pass the location in which storm is found:
echo "Storm build folder is assumed to be found at: $1"
STORM_BUILD_DIR="$1"
STORM_POMDP="${STORM_BUILD_DIR}/bin/storm-pomdp"
echo "Storm-binary: $STORM_POMDP"

echo "Models expected at folder $2"
MODEL_DIR=$2

TO=$3
echo "Time out is $TO seconds"
TIMEOUTCOMMAND="timeout $TO"

#Obstacle
echo "Running obstacle benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/obstacle-6-initial.wr" &> logfiles/iterative/obstacle-6-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative --winningregion -stats --exportwinningregion "winningregion/obstacle-6-fixpoint.wr" &> logfiles/iterative/obstacle-6-fixpoint.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=8 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/obstacle-8-initial.wr" &> logfiles/iterative/obstacle-8-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=8 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative --winningregion -stats --exportwinningregion "winningregion/obstacle-8-fixpoint.wr" &> logfiles/iterative/obstacle-8-fixpoint.log 
# Intercept
echo "Running intercept benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/intercept-7-1-initial.wr" &> logfiles/iterative/intercept-7-1-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/intercept-7-1-fixpoint.wr" &> logfiles/iterative/intercept-7-1-fixpoint.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/intercept-7-2-initial.wr" &> logfiles/iterative/intercept-7-2-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/intercept-7-2-fixpoint.wr" &> logfiles/iterative/intercept-7-2-fixpoint.log 
#Avoid
echo "Running avoid benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/avoid-6-3-initial.wr" &> logfiles/iterative/avoid-6-3-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/avoid-6-3-fixpoint.wr" &> logfiles/iterative/avoid-6-3-fixpoint.log  
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/avoid-7-4-initial.wr" &> logfiles/iterative/avoid-7-4-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/avoid-7-4-fixpoint.wr" &> logfiles/iterative/avoid-7-4-fixpoint.log  
#Evade
echo "Running evade benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/evade-6-2-initial.wr" &> logfiles/iterative/evade-6-2-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/evade-6-2-fixpoint.wr" &> logfiles/iterative/evade-6-2-fixpoint.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/evade-7-2-initial.wr" &> logfiles/iterative/evade-7-2-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/evade-7-2-fixpoint.wr" &> logfiles/iterative/evade-7-2-fixpoint.log 
# Refuel
echo "Running refuel benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/refuel-6-8-initial.wr" &> logfiles/iterative/refuel-6-8-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/refuel-6-8-fixpoint.wr" &> logfiles/iterative/refuel-6-8-fixpoint.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/refuel-7-7-initial.wr" &> logfiles/iterative/refuel-7-7-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/refuel-7-7-fixpoint.wr" &> logfiles/iterative/refuel-7-7-fixpoint.log 
# RockSample
echo "Running rocks benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/rocks-4-initial.wr" &> logfiles/iterative/rocks-4-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/rocks-4-fixpoint.wr" &> logfiles/iterative/rocks-4-fixpoint.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --exportwinningregion "winningregion/rocks-6-initial.wr" &> logfiles/iterative/rocks-6-initial.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch iterative -stats --winningregion --exportwinningregion "winningregion/rocks-6-fixpoint.wr" &> logfiles/iterative/rocks-6-fixpoint.log
