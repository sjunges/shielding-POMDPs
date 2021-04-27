#!/bin/bash         
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 STORMBUILDDIR MODELSDIR TO" >&2
  exit 1
fi

if ! [ -e "logfiles/oneshot" ]; then
  echo "logfiles/oneshot not found. Please create directory" >&2
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
echo "Running 'optimal' benchmark-dependent configuration..."
echo "... Running obstacle benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 6 --lookaheadhorizon 10 &> logfiles/oneshot/obstacle-6-m-4-k-15.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=8 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 5 --lookaheadhorizon 50 &> logfiles/oneshot/obstacle-8-m-5-k-50.log
#Intercept
echo "... Running intercept benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 10 &> logfiles/oneshot/intercept-7-1-m-2-k-10.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 1 --lookaheadhorizon 10 &> logfiles/oneshot/intercept-7-2-m-1-k-10.log
#Avoid
echo "... Running avoid benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 1 --lookaheadhorizon 30 &> logfiles/oneshot/avoid-6-3-m-1-k-30.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 1 --lookaheadhorizon 30 &> logfiles/oneshot/avoid-7-4-m-1-k-30.log
#Evade
echo "... Running evade benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 1 --lookaheadhorizon 20 &> logfiles/oneshot/evade-6-2-m-1-k-20.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 1 --lookaheadhorizon 20 &> logfiles/oneshot/evade-7-2-m-1-k-20.log 
#Refuel
echo "... Running refuel benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 15 &> logfiles/oneshot/refuel-6-8-m-2-k-15.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 15 &> logfiles/oneshot/refuel-7-7-m-2-k-15.log
#RockSample
echo "... Running rocks benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 10 &> logfiles/oneshot/rocks-4-m-2-k-10.log


#Intercept
echo "Running fixed-parameter configuration..."
echo "... Running intercept benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/intercept-7-1-m-2-k-30.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/intercept-7-2-m-2-k-30.log
#Avoid
echo "... Running avoid benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/avoid-6-3-m-2-k-30.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/avoid-7-4-m-2-k-30.log
#Evade
echo "... Running evade benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/evade-6-2-m-2-k-30.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/evade-7-2-m-2-k-30.log 
#Refuel
echo "... Running refuel benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/refuel-6-8-m-2-k-30.log 
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/refuel-7-7-m-2-k-30.log
#RockSample
echo "... Running rocks benchmarks..."
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/rocks-4-m-2-k-30.log
$TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --memorybound 2 --lookaheadhorizon 30 &> logfiles/oneshot/rocks-6-m-2-k-30.log




# #Obstacle
# echo "Running obstacle benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile obstacle-6-m-4-k-10.log --memorybound 4 --lookaheadhorizon 10
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/obstacle.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=8 --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile obstacle-8-m-5-k-45.log --memorybound 5 --lookaheadhorizon 45
# #Intercept
# echo "Running intercept benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=1  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile intercept-7-1-m-2-k-5.log --memorybound 2 --lookaheadhorizon 5
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/intercept.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile intercept-7-2-m-1-k-10.log --memorybound 1 --lookaheadhorizon 5
# #Avoid
# echo "Running avoid benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile avoid-6-3-m-1-k-25.log --memorybound 1 --lookaheadhorizon 25
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=3  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile avoid-6-3-m-1-k-20.log --memorybound 1 --lookaheadhorizon 20
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile avoid-7-4-m-1-k-25.log --memorybound 1 --lookaheadhorizon 25
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/avoid.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile avoid-7-4-m-1-k-20.log --memorybound 1 --lookaheadhorizon 20
# #Evade
# echo "Running evade benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile evade-6-2-m-1-k-15.log --memorybound 1 --lookaheadhorizon 15
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile evade-7-2-m-1-k-15.log --memorybound 1 --lookaheadhorizon 15
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile evade-6-2-m-1-k-10.log --memorybound 1 --lookaheadhorizon 10
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/evade.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,RADIUS=2  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile evade-7-2-m-1-k-10.log --memorybound 1 --lookaheadhorizon 10
# #Refuel
# echo "Running refuel benchmarks..."
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile refuel-6-8-m-2-k-10.log --memorybound 2 --lookaheadhorizon 10
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile refuel-7-7-m-2-k-10.log --memorybound 2 --lookaheadhorizon 10
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6,ENERGY=8  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile refuel-6-8-m-1-k-15.log --memorybound 1 --lookaheadhorizon 15
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/refuel.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=7,ENERGY=7  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile refuel-7-7-m-1-k-15.log --memorybound 1 --lookaheadhorizon 15

# #RockSample
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=4  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile rocks-4-m-2-k-5.log --memorybound 2 --lookaheadhorizon 5
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile rocks-6-m-2-k-10.log --memorybound 2 --lookaheadhorizon 30
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile rocks-6-m-3-k-30.log --memorybound 3 --lookaheadhorizon 30
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile rocks-6-m-4-k-30.log --memorybound 4 --lookaheadhorizon 30
# $TIMEOUTCOMMAND $STORM_POMDP --prism $MODEL_DIR/rocks2.nm --prop "Pmax=? [\"notbad\" U \"goal\"]" -const N=6  --buildstateval --build-all-labels --qualitative-analysis --memlesssearch one-shot -stats --logfile rocks-6-m-5-k-30.log --memorybound 5 --lookaheadhorizon 30

