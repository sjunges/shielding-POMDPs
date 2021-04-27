 #!/bin/bash         

#!/bin/sh
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 STORMBUILDDIR MODELSDIR TO" >&2
  exit 1
fi

# Pass the location in which storm is found:
echo "Storm build folder is assumed to be found at: $1"
STORM_BUILD_DIR="$1"
STORM_POMDP="${STORM_BUILD_DIR}/bin/storm-pomdp"
echo "Storm-binary: $STORM_POMDP"

if ! [ -e "$1" ]; then
  echo "$1 not found" >&2
  exit 1
fi
if ! [ -d "$1" ]; then
  echo "$1 not a directory" >&2
  exit 1
fi

echo "Models expected at folder $2"
MODEL_DIR=$2
if ! [ -e "$2" ]; then
  echo "$2 not found" >&2
  exit 1
fi
if ! [ -d "$2" ]; then
  echo "$2 not a directory" >&2
  exit 1
fi

if ! [ -e "logfiles/belsupmc" ]; then
  echo "logfiles/belsupmc not found. Please create directory" >&2
  exit 1
fi



TO=$3
echo "Time out is $TO seconds"
TIMEOUTCOMMAND="timeout $TO"

 echo "Running refuel benchmarks..."
 $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --belsupmc --sylvan:threads 1 &> logfiles/belsupmc/refuel-6-8-belsup.log
 $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --belsupmc --sylvan:threads 1 &> logfiles/belsupmc/refuel-7-7-belsup.log
#Obstacle
echo "Running obstacle benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6 --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/obstacle-6-belsup.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=8 --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/obstacle-8-belsup.log
#Evade
echo "Running evade benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/evade-6-2-belsup.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/evade-7-2-belsup.log 
# RockSample
echo "Running rocks benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/rocks-4-belsup.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/rocks-6-belsup.log 
# Intercept
echo "Running intercept benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/intercept-7-1-belsup.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/intercept-7-2-belsup.log 
#Avoid
echo "Running avoid benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/avoid-6-3-belsup.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --belsupmc  --sylvan:threads 1 &> logfiles/belsupmc/avoid-7-4-belsup.log  
