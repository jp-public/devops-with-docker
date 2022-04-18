# Simple script that downloads Docker projects from git, builds and publishes them in your Docker-Hub.

## How to use:

1. Build image: ```docker build -t <whatever_you_want_to_call_image> .```

2. Run: ```docker run -v /var/run/docker.sock:/var/run/docker.sock <whate_you_decided_to_call_image_@1> <git_project_to_clone> <name_for_image> <docker_username> <docker_password>``` 
