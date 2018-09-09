FROM elixir:1.7.3
WORKDIR /app

RUN apt-get install git-core

RUN mix local.rebar --force && mix local.hex --force
ENV MIX_ENV=prod TERM=xterm
CMD ["mix", "release", "--env=prod", "--executable", "--verbose"]