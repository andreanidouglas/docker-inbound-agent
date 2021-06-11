# Jenkins agent image with docker-in-docker

This image contains all the necessary dependencies to add an agent to a jenkins
controller that can connect to the host docker daemon and run/build images.

execute:

```bash
docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
    --init andreanidouglas/docker-inbound-agent \
    -url <jenkins_controller_url> \
    <secret> <agent_name>
```



