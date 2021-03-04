#!/bin/bash
project=sentifi-backoffice-prod
part_dir="gs://bigbackup04_08_2019/category_sentiment_ml"



while read sourcepattern 

do

	echo $part_dir/$sourcepattern

	java -jar bigtable-beam-import-1.6.0-shaded.jar import     --runner=dataflow     --project=sentifi-backoffice-prod     --bigtableInstanceId=prod-bo-bigtable     --bigtableTableId=category_sentiment_ml    --sourcePattern="$part_dir/$sourcepattern"   --tempLocation=gs://biglogger/biglog  --workerDiskType=compute.googleapis.com/projects/zones/diskTypes/pd-ssd --diskSizeGb=100   --maxNumWorkers=9 --region=europe-west1     --zone=europe-west1-b     --subnetwork=https://www.googleapis.com/compute/v1/projects/sentifi-backoffice-qa/regions/europe-west1/subnetworks/europe-west1
	
	sleep 0.5
done < category_sentiment_ml.txt
