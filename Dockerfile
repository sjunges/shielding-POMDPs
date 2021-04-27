FROM sjunges/rlshield:cav21
RUN mkdir /opt/experiments
WORKDIR /opt/experiments

RUN mkdir winningregion && mkdir newvideos && mkdir logfiles && mkdir logfiles/iterative && mkdir logfiles/oneshot && mkdir logfiles/belsupmc && mkdir logfiles/rendering && mkdir stats

COPY . .
