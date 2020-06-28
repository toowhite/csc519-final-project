# echo "I want to run job $1" 
# Update all pipelines
for file in /bakerx/cm/jobs/*.yml
do
    jenkins-jobs --conf /etc/jenkins_jobs/jenkins_jobs.ini update $file
done
