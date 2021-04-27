import argparse
import os
import os.path



def parse_wr_computation_stats(filename):
    stats = dict()
    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if line.startswith("States:"):
                stats['nr_states'] = int(line[7:].strip(' \n\t'))
            elif line.startswith("Transitions:"):
                stats['nr_transitions'] = int(line[12:].strip(' \n\t'))
            elif line.startswith("Choices:"):
                stats['nr_choices'] = int(line[8:].strip(' \n\t'))
            elif line.startswith("Observations:"):
                stats['nr_observations'] = int(line[13:].strip(' \n\t'))
            elif line.startswith("#STATS Number of belief support states:"):
                stats['nr_belsupstates'] = "{:.2e}".format(int(line[39:].strip(' \n\t')))
            elif line.startswith("Time for POMDP analysis:"):
                stats['analysis_time'] = float(line[24:-3])
            elif line.startswith("#STATS"):
                key, value = line[7:].split(":")
                if value.strip()[-1] == "s":
                    value = value.strip()[:-1]
                stats[key] = float(value)

    return stats

def collect_log_files(path, prefix, suffix):
    return [os.path.join(path,f) for f in os.listdir(path) if f.endswith(f'{suffix}.log') and f.startswith(prefix)]

benchmarks = ["rocks-4", "rocks-6",
              "refuel-6-8", "refuel-7-7",
              "evade-6-2", "evade-7-2",
              "avoid-6-3", "avoid-7-4",
              "intercept-7-1", "intercept-7-2",
              "obstacle-6", "obstacle-8"]

opt_oneshot = {
"rocks-4" : (2,10) , "rocks-6": (None,None),
"refuel-6-8" : (2,15), "refuel-7-7" : (2,15),
"evade-6-2" : (1,20), "evade-7-2": (1,30),
"avoid-6-3" : (1,30), "avoid-7-4": (1,25),
"intercept-7-1" : (2,10), "intercept-7-2": (1,10),
"obstacle-6": (6,10), "obstacle-8": (5,50)
}

def get_oneshot_suffix(b, m):
    if m == "oneshot-fix":
        return "m-2-k-30"
    elif m == "oneshot-opt":
        m, k = opt_oneshot[b]
        return f"m-{m}-k-{k}"


def get_stats_from_logs(logpath):
    stats = dict()
    for b in benchmarks:
        stats[b] = dict()

    for b in benchmarks:
        for m in ["initial", "fixpoint"]:
            logfiles = collect_log_files(os.path.join(logpath, "iterative"), b, m)
            assert len(logfiles) == 1
            logfile = logfiles[0]
            stats[b][m] = parse_wr_computation_stats(logfile)

    for b in benchmarks:
        for m in ["oneshot-fix", "oneshot-opt"]:
            logfiles = collect_log_files(os.path.join(logpath, "oneshot"), b, get_oneshot_suffix(b, m))
            if len(logfiles) > 0:
                logfile = logfiles[0]
                stats[b][m] = parse_wr_computation_stats(logfile)

    for b in benchmarks:
        logfiles = collect_log_files(os.path.join(logpath, "belsupmc"), b, "belsup")
        if len(logfiles) > 0:
            logfile = logfiles[0]
            stats[b]["belsupmc"] = parse_wr_computation_stats(logfile)

    return stats

def put_stats_in_table(stats, csv_path = None):
    table = []

    def add_table_row_model(name, key):
        table.append([name])
        for b in benchmarks:
            try:
                table[-1].append(str(stats[b]["initial"][key]))
            except KeyError:
                table[-1].append("N/A")

    def add_table_row_method(method, name, key):
        table.append([name])
        for b in benchmarks:
            try:
                table[-1].append(str(stats[b][method][key]))
            except KeyError:
                table[-1].append("N/A ")

    add_table_row_model("States", "nr_states")
    add_table_row_model("Trans", "nr_transitions")
    add_table_row_model("Obs.", "nr_observations")
    add_table_row_model("|b|\t", "nr_belsupstates")
    for m in ["fixpoint", "initial"]:
        add_table_row_method(m, "Time", "analysis_time")
        add_table_row_method(m, "Iter", "Outer iterations")
        add_table_row_method(m, "#solve", "SAT Calls")
    for m in ["oneshot-opt"]:
        add_table_row_method(m, "Time", "analysis_time")
        table.append(["Mem/k"])
        for b in benchmarks:
            mem, k = opt_oneshot[b]
            table[-1].append(f"{mem}/{k}")
    for m in ["oneshot-fix"]:
        add_table_row_method(m, "Time", "analysis_time")
    add_table_row_method("belsupmc", "Time", "analysis_time")

    print("\t\t\t" + "\t".join(benchmarks))
    for r in table:
        print("\t\t\t".join(r))

    if csv_path is not None:
        print(f"Writing to {csv_path}...")
        with open(csv_path, 'w') as file:
            for r in table:
                file.write(",".join(r))
                file.write("\n")
        print("..done.")


def main():
    parser = argparse.ArgumentParser(description='Create tables from experiments')
    parser.add_argument('--logfiles', '-l', help='Path to the logfiles', required=True)
    parser.add_argument('--csv-output', help="If set, the file to write a CSV with the table to")
    args = parser.parse_args()

    stats = get_stats_from_logs(args.logfiles)
    put_stats_in_table(stats, args.csv_output)


if __name__ == "__main__":
    main()