import csv
import subprocess
import os

with open('apps.csv', newline='') as csvfile:
    apps_reader = csv.reader(csvfile, delimiter=',', quotechar='|')
    header = next(apps_reader)
    for row in apps_reader:
    	os.system("bash check.sh apps/" + row[1])
    	# print(row)

