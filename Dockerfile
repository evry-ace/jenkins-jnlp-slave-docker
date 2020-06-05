FROM jenkinsci/jnlp-slave:4.3-1

ARG docker_version=19.03.11

USER root

RUN apt-get update -qq && apt-get install -qqy \
      apt-transport-https \
      ca-certificates \
      curl \
 && rm -rf /var/lib/apt/lists/* \
 && update-ca-certificates -f \
 && curl -vOL "https://download.docker.com/linux/static/stable/x86_64/docker-${docker_version}.tgz" \
 && tar zxvf "docker-${docker_version}.tgz" \
 && chmod +x docker/docker \
 && mv docker/docker /usr/bin/ \
 && rm -rf docker*

USER jenkins
