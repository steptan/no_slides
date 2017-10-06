# Simple game to test out riak

# To get this running on my macbook...

I had to set erlang version, set iex version, set rebar versions for the build.

## Erlang 18.3
To set the erlang version for this shell session, install kerl
```shell
brew install kerl
kerl list releases
kerl build 18.3 18.3
kerl list builds
kerl install 18.3 ~/.kerl/18.3
. ~/.kerl/18.3/activate
erl -v
  Erlang/OTP 18 [erts-7.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]
```

## iex 1.3.4
To set the iex version for this shell session, install kiex
```shell
curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s

kiex list
kiex list known
kiex install 1.3.4 && kiex use $_
kiex use 1.3.4
  Using 1.3.4
iex
  Erlang/OTP 18 [erts-7.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]

  Interactive Elixir (1.3.4) - press Ctrl+C to exit (type h() ENTER for help)
  iex(1)>
```

## mix.exs
Then there are rebar issues with the builds of riak_core_ng and cuttlefish. 
To un-confuse rebar, define which version of rebar should manage the build of riak_core_ng and cuttlefish:

```shell

  defp deps do
    [
            {:riak_core, "~> 3.0", hex: :riak_core_ng, manager: :rebar3},
            {:cuttlefish, "~> 2.0.7", manager: :rebar},
    ]
```

Another gotcha, this is now elixir 1.3.4 old school, so watch the application definition in mix.exs. _do not_ use extra_applications:
```shell
  def application do
    [ mod: {Vyuha.App, []},
        applications: [:riak_core, :logger]]
  end
```

## build
Now build your elixir/riak_core application:

```shell
mix deps.get
mix compile
```

## Credits
Thanks to:

- [gpad/no_slides](https://github.com/gpad/no_slides) Huge thanks -- this is a fork of this repo
- [@naveennegi - vyuha](https://github.com/nav301186/vyuha) the first riak app I worked through
- [@naveennegi - riak core with elixir blog](https://medium.com/@naveennegi/riak-core-with-elixir-part-one-89dc950cef78) the blog
- [kerl](https://github.com/kerl/kerl)
- [kiex](https://github.com/taylor/kiex)
- [basho](http://basho.com/) for creating riak
- [Heinz N. Gies](https://twitter.com/heinz_gies) for creating [riak_core_ng][2] that can be used in [Elixir][3].
