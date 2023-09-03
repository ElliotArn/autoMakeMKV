#!/bin/python3
import os
import subprocess, threading, time, re

outputdir="output"
titles=[]
hej="./hej.sh"
infoScript="./info.sh"
disk="disc:0"
makemkvScript="./mkvScript.sh"
killFake="./KillFake.sh"
renameAndSend="./send.sh"


def makeMkv(title):
    subprocess.run([makemkvScript, disk, title, outputfile])

def kill():
    time.sleep(300)
    entries = os.listdir(outputfile)
    if not entries:
        subprocess.run([killFake, makemkvScript])


thing=subprocess.run([infoScript, disk],capture_output=True)

print(thing.stdout)

titles=(str(thing.stdout))[2:3]

print(titles)

for a in range(int(titles)):
    t = threading.Thread(target=makeMkv, args=str(a),)  # Pass function reference without parentheses
    t2 = threading.Thread(target=kill)  # Pass function reference without parentheses
    t2.start()
    print("t2 has started")
    t.start()
    print("t has started")
    t.join()  # Wait for t to finish
    t2.join()  # Wait for t2 to finish
    print("Both threads have finished")
    subprocess.run([renameAndSend])


print("done")
