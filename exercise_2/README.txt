Adam Reilly
W205 Exercise2
Instructions for Running Twitter Word Count Program

1. Have a virtual machine with postgres and storm enabled. The easiest way to achieve this is to have to download the UCB Exercise 2 AMI and install postgres using the instructions in Lab 2. Make sure that you have access to the data folder (instructions in Lab 2). Make sure that the machine can connect to port 5432 (postgres) when the AMI is setup.

2.  Type the following in the data folder to create the basic sparse framework to run everything correctly: sparse quickstart extweetwordcount. You can run everything as the root user.

3. Make sure that both tweepy and psycog2 are installed on the machine.

4. Replace the default topology with the topology in the github. Replace the python spout and bolt files with the spout and bolt files in github; you do not need to remove the __init__.py files though. Add the additional .py files found in my github to the base of extweetwordcount. I have included my twitter key data in the tweets.py file in spouts, so you do need any enter data as long as this twitter account exists. If the account is not active, you would need to enter the relevant keys from another account. You can add these items in manually with filezilla connected to the AMI, or copy/paste them in using nano.

5. Enter postgres. Create the database tcount. Connect to tcount and create the database wordtweetcount with the columns word (primary key) and count. Note that there is nomenclature in the wordcount.py to create these if you prefer (they have been commented out with a single # so they won't run normally; do not uncomment the lines that start with multiple #). However, after creating the database and table the first time, you would want to comment these lines out again as they will cause errors if the postgres structure already exists.

6. Return to the extweetwordcount base directory (in the data directory) and type: sparse run.ù This will connect to twitter and will start manually words and word counts. Eventually, twitter will throttle the data access, at which point you should quit with ctrl + z.

7. You can then enter postgres and check the tweetwordcount table to confirm that the words and the counts were successfully imported into postgres.

8. You can then run finalresults.py and histogram.py in order to get additional information. Use the instructions in Exercise_2.pdf to run these. However, for histogram.py, please do not put a comma between the 1st and 2nd number and instead use the following style:
python histogram.py 3 8
