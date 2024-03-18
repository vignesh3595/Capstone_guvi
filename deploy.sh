#!/bin/bash
docker run -itd -p 80:80 capstone
docker login -u vigneshvkr -p Vignesh@95
if["$GITHUB_REF" == "refs/heads/dev"];
then
docker build -t vigneshvkr/capstone:v1 .
docker push vigneshvkr/dev-capstone:v1
elif["$GITHUB_REF" == "refs/heads/main"];
then
docker build -t vigneshvkr/capstone:v2 .
docker push vigneshvkr/prod-capstone:v2
else
echo "No action. Branch is not dev or main."
fi