#!/bin/sh

set -o errexit
set -o nounset

NUM_ARGS=$#
if [ $NUM_ARGS -eq 3 ]
then
  POC_HOME=$1
  DEMOG_FILE=$2
  AB_FILE=$3
else
  echo "usage:  sh dataingestion.sh POC_HOME DEMOG_FILE AB_EVENT_FILE\n"
  exit 1
fi

echo "Start Tez PoC data ingestion script: " `date`

hive -e "
  DROP TABLE IF EXISTS ab_events;

  CREATE TABLE IF NOT EXISTS ab_events
  (
    imsi String
    , individual_id String
    , poi_id String
    , timestamp String
  )
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
  LINES TERMINATED BY '\n'
  ;
  
  DROP TABLE IF EXISTS demogs;
  
  CREATE TABLE IF NOT EXISTS demogs
  (
    individual_id String
    , address String
    , age String
    , gender String
    , income String
    , ethnicity String
    , marital_status String
    , household_children_ind String
    , household_children_0_2 String
    , household_children_3_5 String
    , household_children_6_10 String
    , household_children_11_15 String
    , household_children_16_17 String
  )
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
  LINES TERMINATED BY '\n'
  ; 
  
  LOAD DATA LOCAL INPATH
  '$AB_FILE'
  INTO TABLE ab_events;  
 
  LOAD DATA LOCAL INPATH
  '$DEMOG_FILE'
  INTO TABLE demogs; 
  "
  echo "Done: " `date`
