FROM ubuntu
MAINTAINER Patrick O'Doherty <p@trickod.com>

RUN apt-get update
RUN apt-get install -y ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

RUN gem install riemann-dash

EXPOSE 4567

RUN mkdir /etc/riemann
ADD ./config.rb /etc/riemann/riemann-dash-config.rb

CMD ["riemann-dash", "/etc/riemann/riemann-dash-config.rb"]
