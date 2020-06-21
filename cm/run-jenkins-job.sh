# echo "I want to run job $1" 
jenkins-jobs --user admin --password admin update jobs/pipeline.yml

# TODO: trigger job run