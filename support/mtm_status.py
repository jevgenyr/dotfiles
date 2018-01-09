#!/usr/bin/env python

from time import sleep
from datetime import datetime

while True:
    with open("/tmp/mtm_status.txt", "w") as f:
        f.write(datetime.now().strftime("%Y-%m-%d %H:%M"))
    sleep(15)
