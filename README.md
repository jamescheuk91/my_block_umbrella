# MyBlock.Umbrella

#### Requirement:
  * Erlang/OTP 20
  * Elixir 1.5.1
  * Nodejs v8.1.0
  * Postgresql
  * Phantomjs 2.1.1

#### Install Extendable version manager asdf
    $ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1
    # For Ubuntu or other linux distros
    $ echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    $ echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
    # OR for Mac OSX
    $ echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
    $ echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile

#### Install wxWidgets (start observer or debugger!)
    OS X:
    $ brew install wxmac
    Linux:
    $ apt-get -y install libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng3

#### Install Erlang
    $ asdf plugin-add erlang
    $ asdf install erlang 20.0
    $ asdf global erlang 20.0

#### Install Elixir
    $ asdf plugin-add elixir
    $ asdf install elixir 1.5.1
    $ asdf global elixir 1.5.1

#### Install Hex
    $ mix local.hex

#### Install Phoenix
    $ mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

#### To start your Phoenix server
    * Install dependencies with `mix deps.get`
    * Create and migrate your database with `mix ecto.create; mix ecto.migrate`
    * Install AdminWeb Node.js dependencies with `cd apps/my_block_admin_web/assets/ && yarn && cd ../../../`
    * Install Web Node.js dependencies with `cd apps/my_block_web/assets/ && yarn && cd ../../../`
    * Start Phoenix apps with `mix phx.server`
    * Start Phoenix apps in interactive console `iex -S mix phx.server`

[`localhost:3000`](http://localhost:3000) for the Admin Web.
[`localhost:4000`](http://localhost:4000) for the User Web.

#### Run dialyzer
    $ mix dialyzer

#### Run static code analysis
    $ mix credo
    $ mix credo --strict
    $ mix credo suggest
    $ mix credo suggest --help
    $ mix credo list

#### Run ExCoveralls
    $ MIX_ENV=test mix coveralls --umbrella

#### Run ExC

#### Generate Code Dependencies Tree
    $ mix xref graph --format dot
    $ dot -Grankdir=LR -Epenwidth=2 -Ecolor=#a0a0a0  -Tpng xref_graph.dot -o xref_graph.png

#### Launch test watcher:
    $ mix test.watch

#### Run Unit test:
    $ MIX_ENV=test mix unit_test

#### Run Controller test:
    $ MIX_ENV=test mix controller_test

#### Run Integration test:
    $ MIX_ENV=test mix integration_test

#### Run End to End test:
    $ phantomjs --wd
    $ MIX_ENV=test mix e2e_test

#### Run test:
    $ phantomjs --wd
    $ MIX_ENV=test mix test

#### Inspecting your system with Observer
    $ iex -S mix phx.server
    iex> :observer.start

#### Deployment:
    $ mix edeliver build release staging --verbose
    $ mix edeliver deploy release to staging —verbose
    $ mix edeliver start staging
