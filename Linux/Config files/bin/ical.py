#!/usr/bin/env python3
# Print a separated (new-line by default) mapping of weekday abbreviations to day numbers for a month.
# Example output for April 2026: "Wed 1, Thu 2, Fri 3, Sat 4, Sun 5, Mon 6, ..."

from datetime import date
import calendar
import sys


def month_weekday_map(month, year):
    days_in_month = calendar.monthrange(year, month)[1]

    names = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    raw_mappings = []

    for day_in_month in range(1, days_in_month + 1):
        datetime_in_month = date(year, month, day_in_month)
        raw_mappings.append(f"{names[datetime_in_month.weekday()]} {day_in_month}")
    print("\n".join(raw_mappings))


if __name__ == "__main__":
    if len(sys.argv) == 3:
        try:
            m = int(sys.argv[1])
            y = int(sys.argv[2])

            if len(str(y)) == 2:
                y = int("20" + str(y))

            month_weekday_map(m, y)
        except ValueError:
            print("Usage: script.py [month] [year]")
