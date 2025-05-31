from datetime import datetime

def parse_log(path):
    print("=== Identity Lifecycle Logs ===\n")
    with open(path, "r") as log:
        for line in log:
            date, stage, message = line.strip().split(" | ", 2)
            print(f"[{stage}] {date} → {message}")

if __name__ == "__main__":
    parse_log("logs\joiner_log.txt")
    parse_log("logs\mover_log.txt")
    parse_log("logs\leaver_log.txt")
