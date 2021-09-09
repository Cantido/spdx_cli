<!--
SPDX-FileCopyrightText: 2021 Rosa Richter

SPDX-License-Identifier: MIT
-->

# SPDX CLI

A command-line wrapper to the SPDX license list.

## Installation

This program is an Elixir escript, so you will need to [install Elixir](https://elixir-lang.org/install.html) first.

Once Elixir is installed, you can install the escript using `mix`:

```sh
mix escript.install hex spdx_cli
```

This will install the script to `~/.mix/escripts`, which you should add to your `PATH`.

## Usage

Use `spdx` to download license texts.
You will need to know the SPDX identifier for your license.

```
$ spdx MIT
MIT License

Copyright (c) <year> <copyright holders>

THE SOFTWARE IS PROVIDED "AS IS"...
```

Pipe this into a file, and boom, you've got your license!

```sh
spdx MIT > LICENSE
```

You can also use `spdx ls` to list all licenses in the database, possibly for piping into `grep`.

```sh
spdx ls | grep 'Creative Commmons' | wc -l
49
```

## Other projects like this

Check out the Free Software Foundation Europe's [REUSE helper tool](https://github.com/fsfe/reuse-tool).
It can lint your project against the REUSE specification,
which makes it easier for other people to reuse your work.
It can also download licenses, and add licensing headers to your source files.

## Roadmap

- ~Fetch license text~
- ~Fetch other license fields (name, header)~
- Search licenses by name or ID

Please suggest more cool stuff I can do with this!

## Maintainer

This project was developed by [Rosa Richter](https://about.me/rosa.richter).
You can get in touch with her on [Keybase.io](https://keybase.io/cantido).
There is also a [mailing list] for this project.

## Contributing

Questions and pull requests are more than welcome.
I follow Elixir's tenet of bad documentation being a bug,
so if anything is unclear, please [file an issue](https://todo.sr.ht/~cosmicrose/spdx_cli) or ask on the [mailing list]!
Ideally, my answer to your question will be in an update to the docs.

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for all the details you could ever want about helping me with this project.

Note that this project is released with a Contributor [Code of Conduct].
By participating in this project you agree to abide by its terms.

## License

MIT License

Copyright 2021 Rosa Richter

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[Code of Conduct]: code_of_conduct.md
[mailing list]: https://lists.sr.ht/~cosmicrose/spdx_cli
