# -*- coding: utf-8 -*-
"""
Created on Sun Apr  2 19:51:12 2017

@author: PC
"""

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import sys

conn = psycopg2.connect(database="tcount", user="postgres", password="postgres", host="localhost", port="5432")
cur = conn.cursor()

if sys.argv[-1] == 'finalresults.py':
    full_list = cur.execute("SELECT * from tweetwordcount ORDER BY word")
    total = cur.fetchall()
    print(total)
else:
    word = sys.argv[1]
    cur.execute("SELECT word, count from tweetwordcount where word=%s", (sys.argv[1], ))
    count = cur.fetchone()
    print(count)
