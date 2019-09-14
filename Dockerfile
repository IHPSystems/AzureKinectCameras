FROM julia:1.0-buster

RUN apt-get update && apt-get install -y \
  gnupg2
RUN curl https://packages.microsoft.com/keys/microsoft.asc \
  | apt-key add -
RUN echo "deb https://packages.microsoft.com/ubuntu/18.04/prod bionic main" \
  | tee /etc/apt/sources.list.d/microsoft.list
RUN apt-get update
RUN ["/bin/bash", "-c", "apt-get install -y libk4a1.2-dev <<< 'yes'"]
