# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

ARG MIX_ENV=dev

all:
  BUILD +test
  BUILD +lint
  BUILD +lint-copyright
  BUILD +lint-format
  BUILD +docker

get-deps:
  FROM elixir:1.12-alpine
  WORKDIR /app
  RUN mix do local.rebar --force, local.hex --force
  COPY mix.exs .
  COPY mix.lock .

  RUN mix deps.get

compile-deps:
  FROM +get-deps
  RUN MIX_ENV=$MIX_ENV mix deps.compile

build:
  FROM +compile-deps

  COPY lib ./lib

  RUN MIX_ENV=$MIX_ENV mix compile

test:
  FROM --build-arg MIX_ENV=test +build

  COPY test ./test

  RUN MIX_ENV=test mix test

lint:
  FROM +build

  RUN mix credo list

lint-format:
  FROM +build

  COPY .formatter.exs .

  RUN mix format --check-formatted

lint-copyright:
  FROM fsfe/reuse

  COPY . .

  RUN reuse lint

escript:
  FROM +build

  RUN MIX_ENV=$MIX_ENV mix escript.build
  SAVE ARTIFACT spdx AS LOCAL ./spdx

docker:
  FROM elixir:1.12-alpine
  WORKDIR /app

  COPY --build-arg MIX_ENV=prod +escript/spdx .

  ENTRYPOINT ["/app/spdx"]

  SAVE IMAGE --push ghcr.io/cantido/spdx_cli:latest
