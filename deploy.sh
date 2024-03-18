#!/bin/bash
docker run -itd -p 80:80 capstone
docker login -u vigneshvkr -p $docker_pass
if["$GIT_BRANCH" -eq "origin/dev"]; 
then
docker tag capstone vigneshvkr/dev:v1 .
docker push vigneshvkr/dev:v1
elif["$GIT_BRANCH" -eq "origin/main"];
then
docker tag capstone vigneshvkr/prod:v2 .
docker push vigneshvkr/prod:v2
else
echo "No action. Branch is not dev or main."
fi
