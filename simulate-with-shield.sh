if [ "$#" -ne 4 ]; then
  echo "Usage: $0 RLSHIELD_PATH WINNING_REGION_DIR NR_VIDEOS_PER_BENCHMARK EPISODES_FOR_STATS" >&2
  exit 1
fi
RLSHIELD_PATH=$1
WINNING_REGION=$2
NR_VIDEOS_PER_BENCHMARK=$3
NR_RUNS_FOR_STATS=$4
TOTAL_VIDEOS=36*$NR_VIDEOS_PER_BENCHMARK

if ! [ -e "logfiles/rendering" ]; then
  echo "logfiles/rendering not found. Please create directory" >&2
  exit 1
fi

if ! [ -e "stats" ]; then
  echo "stats/ not found. Please create directory" >&2
  exit 1
fi

echo "You will see $TOTAL_VIDEOS bars fill up slowly. Get some coffee :-)!"

echo "Benchmark rocks..."
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=6 -wr $WINNING_REGION/rocks-6-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Rocks (6) with 'initial' shield" --logfile logfiles/rendering/rocks-6-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=6 -wr $WINNING_REGION/rocks-6-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Rocks (6) with 'initial' shield" --logfile logfiles/rendering/rocks-6-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=6 -wr $WINNING_REGION/rocks-6-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Rocks (6) with 'fixpoint' shield" --logfile logfiles/rendering/rocks-6-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=6 -wr $WINNING_REGION/rocks-6-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Rocks (6) with 'fixpoint' shield" --logfile logfiles/rendering/rocks-6-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=4 -wr $WINNING_REGION/rocks-4-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Rocks (4) with 'initial' shield" --logfile logfiles/rendering/rocks-4-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=4 -wr $WINNING_REGION/rocks-4-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Rocks (4) with 'initial' shield" --logfile logfiles/rendering/rocks-4-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=4 -wr $WINNING_REGION/rocks-4-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Rocks (4) with 'fixpoint' shield" --logfile logfiles/rendering/rocks-4-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=4 -wr $WINNING_REGION/rocks-4-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Rocks (4) with 'fixpoint' shield" --logfile logfiles/rendering/rocks-4-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=6 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Rocks (6) without shield" --logfile logfiles/rendering/rocks-6-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=6 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Rocks (6) without shield" --logfile logfiles/rendering/rocks-6-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=4 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Rocks (4) without shield" --logfile logfiles/rendering/rocks-4-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m rocks --constants N=4 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Rocks (4) without shield" --logfile logfiles/rendering/rocks-4-noshield.log


echo "Benchmark evade..."
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=6,RADIUS=2 -wr $WINNING_REGION/evade-6-2-initial.wr -s 250 -N $NR_VIDEOS_PER_BENCHMARK --max-runs 400 --video-path newvideos/ --finishers-only --title "Evade (6,2) with 'initial' shield" --logfile logfiles/rendering/evade-6-2-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=6,RADIUS=2 -wr $WINNING_REGION/evade-6-2-initial.wr -s 250 -N $NR_RUNS_FOR_STATS --max-runs 400 --stats-path stats/ --title "Evade (6,2) with 'initial' shield" --logfile logfiles/rendering/evade-6-2-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=6,RADIUS=2 -wr $WINNING_REGION/evade-6-2-fixpoint.wr -s 250 -N $NR_VIDEOS_PER_BENCHMARK --max-runs 400 --video-path newvideos/ --finishers-only --title "Evade (6,2) with 'fixpoint' shield" --logfile logfiles/rendering/evade-6-2-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=6,RADIUS=2 -wr $WINNING_REGION/evade-6-2-fixpoint.wr -s 250 -N $NR_RUNS_FOR_STATS --max-runs 400  --stats-path stats/ --title "Evade (6,2) with 'fixpoint' shield" --logfile logfiles/rendering/evade-6-2-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=7,RADIUS=2 -wr $WINNING_REGION/evade-7-2-initial.wr -s 250 -N $NR_VIDEOS_PER_BENCHMARK --max-runs 400 --video-path newvideos/ --finishers-only --title "Evade (7,2) with 'initial' shield" --logfile logfiles/rendering/evade-7-2-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=7,RADIUS=2 -wr $WINNING_REGION/evade-7-2-initial.wr -s 250 -N $NR_RUNS_FOR_STATS --max-runs 400 --stats-path stats/ --title "Evade (7,2) with 'initial' shield" --logfile logfiles/rendering/evade-7-2-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=7,RADIUS=2 -wr $WINNING_REGION/evade-7-2-fixpoint.wr -s 250 -N $NR_VIDEOS_PER_BENCHMARK --max-runs 400 --video-path newvideos/ --finishers-only --title "Evade (7,2) with 'fixpoint' shield" --logfile logfiles/rendering/evade-7-2-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=7,RADIUS=2 -wr $WINNING_REGION/evade-7-2-fixpoint.wr -s 250 -N $NR_RUNS_FOR_STATS --max-runs 400 --stats-path stats/ --title "Evade (7,2) with 'fixpoint' shield" --logfile logfiles/rendering/evade-7-2-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=6,RADIUS=2 --noshield -s 250 -N $NR_VIDEOS_PER_BENCHMARK --max-runs 400 --video-path newvideos/ --finishers-only --title "Evade (6,2) without shield" --logfile logfiles/rendering/evade-6-2-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=6,RADIUS=2 --noshield -s 250 -N $NR_RUNS_FOR_STATS --max-runs 400 --stats-path stats/ --title "Evade (6,2) without shield" --logfile logfiles/rendering/evade-6-2-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=7,RADIUS=2 --noshield -s 250 -N $NR_VIDEOS_PER_BENCHMARK --max-runs 400 --video-path newvideos/ --finishers-only --title "Evade (7,2) without shield" --logfile logfiles/rendering/evade-7-2-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m evade --constants N=7,RADIUS=2 --noshield -s 250 -N $NR_RUNS_FOR_STATS --max-runs 400 --stats-path stats/ --title "Evade (7,2) without shield" --logfile logfiles/rendering/evade-7-2-noshield.log


echo "Benchmark avoid..."
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=6,RADIUS=3 -wr $WINNING_REGION/avoid-6-3-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Avoid (6,3) with 'initial' shield" --logfile logfiles/rendering/avoid-6-3-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=6,RADIUS=3 -wr $WINNING_REGION/avoid-6-3-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Avoid (6,3) with 'initial' shield" --logfile logfiles/rendering/avoid-6-3-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=6,RADIUS=3 -wr $WINNING_REGION/avoid-6-3-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Avoid (6,3) with 'fixpoint' shield" --logfile logfiles/rendering/avoid-6-3-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=6,RADIUS=3 -wr $WINNING_REGION/avoid-6-3-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Avoid (6,3) with 'fixpoint' shield" --logfile logfiles/rendering/avoid-6-3-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=7,RADIUS=4 -wr $WINNING_REGION/avoid-7-4-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Avoid (7,4) with 'initial' shield" --logfile logfiles/rendering/avoid-7-4-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=7,RADIUS=4 -wr $WINNING_REGION/avoid-7-4-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Avoid (7,4) with 'initial' shield" --logfile logfiles/rendering/avoid-7-4-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=7,RADIUS=4 -wr $WINNING_REGION/avoid-7-4-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Avoid (7,4) with 'fixpoint' shield" --logfile logfiles/rendering/avoid-7-4-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=7,RADIUS=4 -wr $WINNING_REGION/avoid-7-4-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Avoid (7,4) with 'fixpoint' shield" --logfile logfiles/rendering/avoid-7-4-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=6,RADIUS=3 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Avoid (6,3) without shield" --logfile logfiles/rendering/avoid-6-3-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=6,RADIUS=3 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Avoid (6,3) without shield" --logfile logfiles/rendering/avoid-6-3-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=7,RADIUS=4 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Avoid (7,4) without shield" --logfile logfiles/rendering/avoid-7-4-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m avoid --constants N=7,RADIUS=4 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Avoid (7,4) without shield" --logfile logfiles/rendering/avoid-7-4-noshield.log


echo "Benchmark intercept..."
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=1 -wr $WINNING_REGION/intercept-7-1-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Intercept (7,1) with 'initial' shield" --logfile logfiles/rendering/intercept-7-1-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=1 -wr $WINNING_REGION/intercept-7-1-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Intercept (7,1) with 'initial' shield" --logfile logfiles/rendering/intercept-7-1-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=1 -wr $WINNING_REGION/intercept-7-1-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Intercept (7,1) with 'fixpoint' shield" --logfile logfiles/rendering/intercept-7-1-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=1 -wr $WINNING_REGION/intercept-7-1-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Intercept (7,1) with 'fixpoint' shield" --logfile logfiles/rendering/intercept-7-1-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=2 -wr $WINNING_REGION/intercept-7-2-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Intercept (7,2) with 'initial' shield" --logfile logfiles/rendering/intercept-7-2-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=2 -wr $WINNING_REGION/intercept-7-2-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Intercept (7,2) with 'initial' shield" --logfile logfiles/rendering/intercept-7-2-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=2 -wr $WINNING_REGION/intercept-7-2-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Intercept (7,2) with 'fixpoint' shield" --logfile logfiles/rendering/intercept-7-2-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=2 -wr $WINNING_REGION/intercept-7-2-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Intercept (7,2) with 'fixpoint' shield" --logfile logfiles/rendering/intercept-7-2-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=1 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Intercept (7,1) without shield" --logfile logfiles/rendering/intercept-7-1-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=1 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Intercept (7,1) without shield" --logfile logfiles/rendering/intercept-7-1-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=2 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Intercept (7,2) without shield" --logfile logfiles/rendering/intercept-7-2-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m intercept --constants N=7,RADIUS=2 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Intercept (7,2) without shield" --logfile logfiles/rendering/intercept-7-2-noshield.log


echo "Benchmark obstacle..."
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=6 -wr $WINNING_REGION/obstacle-6-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Obstacle (6) with 'initial' shield" --logfile logfiles/rendering/obstacle-6-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=6 -wr $WINNING_REGION/obstacle-6-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Obstacle (6) with 'initial' shield" --logfile logfiles/rendering/obstacle-6-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=6 -wr $WINNING_REGION/obstacle-6-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Obstacle (6) with 'fixpoint' shield" --logfile logfiles/rendering/obstacle-6-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=6 -wr $WINNING_REGION/obstacle-6-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Obstacle (6) with 'fixpoint' shield" --logfile logfiles/rendering/obstacle-6-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=8 -wr $WINNING_REGION/obstacle-8-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Obstacle (8) with 'initial' shield" --logfile logfiles/rendering/obstacle-8-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=8 -wr $WINNING_REGION/obstacle-8-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Obstacle (8) with 'initial' shield" --logfile logfiles/rendering/obstacle-8-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=8 -wr $WINNING_REGION/obstacle-8-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Obstacle (8) with 'fixpoint' shield" --logfile logfiles/rendering/obstacle-8-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=8 -wr $WINNING_REGION/obstacle-8-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Obstacle (8) with 'fixpoint' shield" --logfile logfiles/rendering/obstacle-8-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=6 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Obstacle (6) without shield" --logfile logfiles/rendering/obstacle-6-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=6 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Obstacle (6) without shield" --logfile logfiles/rendering/obstacle-6-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=8 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Obstacle (8) without shield" --logfile logfiles/rendering/obstacle-8-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m obstacle --constants N=8 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Obstacle (8) without shield" --logfile logfiles/rendering/obstacle-8-noshield.log


echo "Benchmark refuel..."
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=6,ENERGY=8 -wr $WINNING_REGION/refuel-6-8-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Refuel (6,8) with 'initial' shield" --logfile logfiles/rendering/refuel-6-8-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=6,ENERGY=8 -wr $WINNING_REGION/refuel-6-8-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Refuel (6,8) with 'initial' shield" --logfile logfiles/rendering/refuel-6-8-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=6,ENERGY=8 -wr $WINNING_REGION/refuel-6-8-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Refuel (6,8) with 'fixpoint' shield" --logfile logfiles/rendering/refuel-6-8-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=6,ENERGY=8 -wr $WINNING_REGION/refuel-6-8-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Refuel (6,8) with 'fixpoint' shield" --logfile logfiles/rendering/refuel-6-8-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=7,ENERGY=7 -wr $WINNING_REGION/refuel-7-7-initial.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Refuel (7,7) with 'initial' shield" --logfile logfiles/rendering/refuel-7-7-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=7,ENERGY=7 -wr $WINNING_REGION/refuel-7-7-initial.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Refuel (7,7) with 'initial' shield" --logfile logfiles/rendering/refuel-7-7-initial.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=7,ENERGY=7 -wr $WINNING_REGION/refuel-7-7-fixpoint.wr -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Refuel (7,7) with 'fixpoint' shield" --logfile logfiles/rendering/refuel-7-7-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=7,ENERGY=7 -wr $WINNING_REGION/refuel-7-7-fixpoint.wr -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Refuel (7,7) with 'fixpoint' shield" --logfile logfiles/rendering/refuel-7-7-fixpoint.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=6,ENERGY=8 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Refuel (6,8) without shield" --logfile logfiles/rendering/refuel-6-8-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=6,ENERGY=8 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Refuel (6,8) without shield" --logfile logfiles/rendering/refuel-6-8-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=7,ENERGY=7 --noshield -s 150 -N $NR_VIDEOS_PER_BENCHMARK --video-path newvideos/ --finishers-only --title "Refuel (7,7) without shield" --logfile logfiles/rendering/refuel-7-7-noshield.log
python $RLSHIELD_PATH/rlshield/shield.py -m refuel --constants N=7,ENERGY=7 --noshield -s 150 -N $NR_RUNS_FOR_STATS --stats-path stats/ --title "Refuel (7,7) without shield" --logfile logfiles/rendering/refuel-7-7-noshield.log