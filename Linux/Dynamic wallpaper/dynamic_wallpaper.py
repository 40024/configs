#!/usr/bin/env python3

from datetime import datetime, time
from zoneinfo import ZoneInfo
import subprocess
import sys
from pathlib import Path

# Map period names to image paths (full paths)
WALLPAPERS = {
    "dawn": "/home/v/Pictures/Wallpapers/Tahoe/26-Tahoe-Beach-Dawn.png",
    "day": "/home/v/Pictures/Wallpapers/Tahoe/26-Tahoe-Beach-Day.png",
    "dusk": "/home/v/Pictures/Wallpapers/Tahoe/26-Tahoe-Beach-Dusk.png",
    "night": "/home/v/Pictures/Wallpapers/Tahoe/26-Tahoe-Beach-Night.png",
}

# Temporarily using hardcoded periods, find an API for this
# Define periods as half-open intervals [start, end)
PERIODS = {
    "dawn":  (time(6, 0),  time(12, 0)),     # 06:00-11:59
    "day":   (time(12, 0), time(18, 0)),     # 12:00-17:59
    "dusk":  (time(18, 0), time(22, 0)),     # 18:00-21:59
    "night": (time(22, 0), time(6, 0)),      # 22:00-05:59 (wraps)
}

TZ = ZoneInfo("America/Los_Angeles")
STATE_FILE = Path.home() / ".cache" / "dynamic_wallpaper_last"

def now_period(dt: datetime) -> str:
    t = dt.time()
    for name, (start, end) in PERIODS.items():
        if start <= end:
            if start <= t < end:
                return name
        # wrap midnight
        else:
            if t >= start or t < end:
                return name
    return "night"

def read_last() -> str | None:
    try:
        return STATE_FILE.read_text().strip()
    except Exception:
        return None

def write_last(p: str):
    try:
        STATE_FILE.parent.mkdir(parents=True, exist_ok=True)
        STATE_FILE.write_text(p)
    except Exception:
        pass

def set_wallpaper(path: str) -> int:
    cmd = ["/usr/bin/swww", "img", path]
    try:
        res = subprocess.run(cmd, check=False)
        return res.returncode
    except FileNotFoundError:
        print("swww not found at /usr/bin/swww", file=sys.stderr)
        return 2

def main():
    dt = datetime.now(TZ)
    period = now_period(dt)
    wallpaper = WALLPAPERS.get(period)
    if not wallpaper:
        print(f"No wallpaper configured for period {period}", file=sys.stderr)
        sys.exit(1)
    last = read_last()
    if last == period:
        return
    rc = set_wallpaper(wallpaper)
    if rc == 0:
        write_last(period)
    else:
        sys.exit(rc)

if __name__ == "__main__":
    main()
