RLSHIELD=$1
WINNING_REGION=$2


python $1 -m rocks --constants N=6 -wr $2/rocks-6-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Rocks (6) with 'initial' shield"
mv rendering.log rocks-6-initial.log
python $1 -m rocks --constants N=6 -wr $2/rocks-6-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Rocks (6) with 'fixpoint' shield"
mv rendering.log rocks-6-fixpoint.log
python $1 -m rocks --constants N=4 -wr $2/rocks-4-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Rocks (4) with 'initial' shield"
mv rendering.log rocks-4-initial.log
python $1 -m rocks --constants N=4 -wr $2/rocks-4-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Rocks (4) with 'fixpoint' shield"
mv rendering.log rocks-4-fixpoint.lo6
python $1 -m rocks --constants N=6 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Rocks (6) without shield"
mv rendering.log rocks-6-noshield.log
python $1 -m rocks --constants N=4 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Rocks (4) without shield"
mv rendering.log rocks-4-noshield.log

python $1 -m evade --constants N=6,RADIUS=2 -wr $2/evade-6-2-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Evade (6,2) with 'initial' shield"
mv rendering.log evade-6-2-initial.log
python $1 -m evade --constants N=6,RADIUS=2 -wr $2/evade-6-2-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Evade (6,2) with 'fixpoint' shield"
mv rendering.log evade-6-2-fixpoint.log
python $1 -m evade --constants N=7,RADIUS=2 -wr $2/evade-7-2-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Evade (7,2) with 'initial' shield"
mv rendering.log evade-7-2-initial.log
python $1 -m evade --constants N=7,RADIUS=2 -wr $2/evade-7-2-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Evade (7,2) with 'fixpoint' shield"
mv rendering.log evade-7-2-fixpoint.log
python $1 -m evade --constants N=6,RADIUS=2 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Evade (6,2) without shield"
mv rendering.log evade-6-2-noshield.log
python $1 -m evade --constants N=7,RADIUS=2 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Evade (7,2) without shield"
mv rendering.log evade-7-2-noshield.log


python $1 -m avoid --constants N=6,RADIUS=3 -wr $2/avoid-6-3-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Avoid (6,3) with 'initial' shield"
mv rendering.log avoid-6-3-initial.log
python $1 -m avoid --constants N=6,RADIUS=3 -wr $2/avoid-6-3-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Avoid (6,3) with 'fixpoint' shield"
mv rendering.log avoid-6-3-fixpoint.log
python $1 -m avoid --constants N=7,RADIUS=4 -wr $2/avoid-7-4-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Avoid (7,4) with 'initial' shield"
mv rendering.log avoid-7-4-initial.log
python $1 -m avoid --constants N=7,RADIUS=4 -wr $2/avoid-7-4-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Avoid (7,4) with 'fixpoint' shield"
mv rendering.log avoid-7-4-fixpoint.log
python $1 -m avoid --constants N=6,RADIUS=3 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Avoid (6,3) without shield"
mv rendering.log avoid-6-3-noshield.log
python $1 -m avoid --constants N=7,RADIUS=4 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Avoid (7,4) without shield"
mv rendering.log avoid-7-4-noshield.log

python $1 -m intercept --constants N=7,RADIUS=1 -wr $2/intercept-7-1-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Intercept (7,1) with 'initial' shield"
mv rendering.log intercept-7-1-initial.log
python $1 -m intercept --constants N=7,RADIUS=1 -wr $2/intercept-7-1-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Intercept (7,1) with 'fixpoint' shield"
mv rendering.log intercept-7-1-fixpoint.log
python $1 -m intercept --constants N=7,RADIUS=2 -wr $2/intercept-7-2-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Intercept (7,2) with 'initial' shield"
mv rendering.log intercept-7-2-initial.log
python $1 -m intercept --constants N=7,RADIUS=2 -wr $2/intercept-7-2-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Intercept (7,2) with 'fixpoint' shield"
mv rendering.log intercept-7-2-fixpoint.log
python $1 -m intercept --constants N=7,RADIUS=1 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Intercept (7,1) without shield"
mv rendering.log intercept-7-1-noshield.log
python $1 -m intercept --constants N=7,RADIUS=2 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Intercept (7,2) without shield"
mv rendering.log intercept-7-2-noshield.log

python $1 -m obstacle --constants N=6 -wr $2/obstacle-6-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Obstacle (6) with 'initial' shield"
mv rendering.log obstacle-6-initial.log
python $1 -m obstacle --constants N=6 -wr $2/obstacle-6-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Obstacle (6) with 'fixpoint' shield"
mv rendering.log obstacle-6-fixpoint.log
python $1 -m obstacle --constants N=8 -wr $2/obstacle-8-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Obstacle (8) with 'initial' shield"
mv rendering.log obstacle-8-initial.log
python $1 -m obstacle --constants N=8 -wr $2/obstacle-8-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Obstacle (8) with 'fixpoint' shield"
mv rendering.log obstacle-8-fixpoint.log
python $1 -m obstacle --constants N=6 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Obstacle (6) without shield"
mv rendering.log obstacle-6-noshield.log
python $1 -m obstacle --constants N=8 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Obstacle (8) without shield"
mv rendering.log obstacle-8-noshield.log

python $1 -m refuel --constants N=6,ENERGY=8 -wr $2/refuel-6-8-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Refuel (6,8) with 'initial' shield"
mv rendering.log refuel-6-8-initial.log
python $1 -m refuel --constants N=6,ENERGY=8 -wr $2/refuel-6-8-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Refuel (6,8) with 'fixpoint' shield"
mv rendering.log refuel-6-8-fixpoint.log
python $1 -m refuel --constants N=7,ENERGY=7 -wr $2/refuel-7-7-initial.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Refuel (7,7) with 'initial' shield"
mv rendering.log refuel-7-7-initial.log
python $1 -m refuel --constants N=7,ENERGY=7 -wr $2/refuel-7-7-fixpoint.wr -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Refuel (7,7) with 'fixpoint' shield"
mv rendering.log refuel-7-7-fixpoint.log
python $1 -m refuel --constants N=6,ENERGY=8 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Refuel (6,8) without shield"
mv rendering.log refuel-6-8-noshield.log
python $1 -m refuel --constants N=7,ENERGY=7 --noshield -s 150 -N 5 --video-path newvideos/ --finishers-only --title "Refuel (7,7) without shield"
mv rendering.log refuel-7-7-noshield.log