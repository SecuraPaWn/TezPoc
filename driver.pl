#!usr/bin/perl
#Script to start console logging and execute hive commands in shell script - tezPoChivecommands
system("sh dataingestion.sh /root/PoCwork/ /root/PoCwork/sample_data/one_person_demog.txt /root/PoCwork/sample_data/one_person_500_ab_events.txt");
system("sh startlogging.sh");
system("sh extractor.sh");
system("rm -rf hivecmdoutput_log"); 
system("python visualizer.py"); 
