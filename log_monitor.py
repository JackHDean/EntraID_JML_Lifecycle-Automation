import csv
from pathlib import Path

def read_log(file_path):
    if not Path(file_path).exists():
        print(f"Log {file_path} not found.")
        return
    print(f"\nReading {file_path}")
    with open(file_path, newline='') as csvfile:
        for row in csv.reader(csvfile):
            print(" | ".join(row))

read_log("logs/joiner_log.csv")
read_log("logs/mover_log.csv")
read_log("logs/leaver_log.csv")
