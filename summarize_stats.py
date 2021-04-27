
benchmarks = ["rocks-4", "rocks-6",
              "refuel-6-8", "refuel-7-7",
              "evade-6-2", "evade-7-2",
              "avoid-6-3", "avoid-7-4",
              "intercept-7-1", "intercept-7-2",
              "obstacle-6", "obstacle-8"]

stats = dict()
for b in benchmarks:
    stats[b] = dict()
    for m in ["initial", "fixpoint"]:
        stats[b][m] = dict()
        with open(f"stats/{b}-{m}.stats") as file:
            for line in file:

                if line.startswith("Available avg:"):
                    stats[b][m]["av_avg"] = line.split(":")[1].strip()
                elif line.startswith("Available avg stdev:"):
                    stats[b][m]["av_avg_stdev"] = line.split(":")[1].strip()


print("Avg (fraction of) actions available with 'initial' shield vs. Avg (fraction of) actions available with 'fixpoint' shield:")
print("Together with stdev. in parentheses")
for b, bstat in stats.items():
    inavg = bstat["initial"]["av_avg"]
    inavgstdev = bstat["initial"]["av_avg_stdev"]
    fixavg = bstat["fixpoint"]["av_avg"]
    fixavgstdev = bstat["fixpoint"]["av_avg_stdev"]

    print(f"{b}: {inavg} ({inavgstdev}) vs {fixavg} ({fixavgstdev})")
