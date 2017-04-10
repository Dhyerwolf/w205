from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Connect to the database
        conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localh$

        try:
        # CREATE DATABASE can't run inside a transaction
                conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
                cur = conn.cursor()
                cur.execute("CREATE DATABASE tcount")
                cur.close()
                conn.close()
        except:
                print ("Could not create tcount")
		
		 #Connecting to tcount
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhos$
        #Create a Table
        #The first step is to create a cursor.
        cur = conn.cursor()
        cur.execute('''CREATE TABLE tweetwordcount
                (word TEXT PRIMARY KEY     NOT NULL,
                count INT     NOT NULL);''')
        conn.commit()

        # Use psycopg to interact with Postgres
        cur = conn.cursor()
        #Insert
        cur.execute("INSERT INTO tweetwordcount (word,count) \
                VALUES (word, count)");
        conn.commit()

        #Using variables to update
        count= count + 1
        word= word
        cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (uCount, uWord))
        conn.commit()

        #Select
        cur.execute("SELECT word, count from tweetwordcount")
        records = cur.fetchall()
        for rec in records:
                print ("word = ", rec[0])
                print ("count = ", rec[1], "\n")
        conn.commit()
		
		conn.close()

		
		
		
		
		
		






































#WHAT I PUT IN (AND THEN HAD TO EDIT TO THE VERSION BELOW)
from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
		# Connect to the database
		conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
		try:
		# CREATE DATABASE can't run inside a transaction
		conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
		cur = conn.cursor()
		cur.execute("CREATE DATABASE tcount")
		cur.close()
		conn.close()
		except:
			print "Could not create tcount"
		#Connecting to tcount
		conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
		#Create a Table
		#The first step is to create a cursor. 
		cur = conn.cursor()
		cur.execute('''CREATE TABLE tweetwordcount
			(word TEXT PRIMARY KEY     NOT NULL,
			count INT     NOT NULL);''')
		conn.commit()
        # Use psycopg to interact with Postgres
        cur = conn.cursor()
		#Insert
		cur.execute("INSERT INTO tweetwordcount (word,count) \
			VALUES (word, count)");
		conn.commit()
		#Using variables to update
		count= count + 1
		word= word
		cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (uCount, uWord))
		conn.commit()

		#Select
		cur.execute("SELECT word, count from tweetwordcount")
		records = cur.fetchall()
		for rec in records:
		print "word = ", rec[0]
		print "count = ", rec[1], "\n"
		conn.commit()

		conn.close()

		
##WHAT IS IN THEIR NOW AND DOESN'T WORK. IT'S NOT IMPOSSIBLE THAT IT'S JUST THE SPOUT

from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Connect to the database
        conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localh$

        try:
        # CREATE DATABASE can't run inside a transaction
                conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
                cur = conn.cursor()
                cur.execute("CREATE DATABASE tcount")
                cur.close()
                conn.close()
        except:
                print ("Could not create tcount")
		
		 #Connecting to tcount
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhos$
        #Create a Table
        #The first step is to create a cursor.
        cur = conn.cursor()
        cur.execute('''CREATE TABLE tweetwordcount
                (word TEXT PRIMARY KEY     NOT NULL,
                count INT     NOT NULL);''')
        conn.commit()

        # Use psycopg to interact with Postgres
        cur = conn.cursor()
        #Insert
        cur.execute("INSERT INTO tweetwordcount (word,count) \
                VALUES (word, count)");
        conn.commit()

        #Using variables to update
        count= count + 1
        word= word
        cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (uCount, uWord))
        conn.commit()

        #Select
        cur.execute("SELECT word, count from tweetwordcount")
        records = cur.fetchall()
        for rec in records:
                print ("word = ", rec[0])
                print ("count = ", rec[1], "\n")
        conn.commit()
		
		conn.close()


