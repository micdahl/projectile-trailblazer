FROM python:2.7

RUN apt-get update -qq && apt-get install -y emacs-nox ruby
RUN gem install bundler

RUN useradd -ms /bin/bash trailblazer
USER trailblazer

WORKDIR /home/trailblazer
RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
ENV HOME /home/trailblazer
ENV PATH $HOME/.cask/bin:$PATH
ENV APP_HOME /home/trailblazer/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
