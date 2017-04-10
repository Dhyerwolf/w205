# -*- coding: utf-8 -*-
"""
Created on Sun Apr  2 19:59:47 2017

@author: PC
"""

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import sys

conn = psycopg2.connect(database="tcount", user="postgres", password="postgres", host="localhost", port="5432")
cur = conn.cursor()
k1 = sys.argv[1]
k2 = sys.argv[2]

full_list = cur.execute("SELECT * from tweetwordcount where count>=%s and count<=%s order by count desc", (k1, k2))
total = cur.fetchall()
for i in total:
	print(i)
