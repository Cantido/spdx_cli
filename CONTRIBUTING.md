<!--
SPDX-FileCopyrightText: 2021 Rosa Richter

SPDX-License-Identifier: MIT
-->

# Contributing

Thank you for considering contributing!
I write libraries in my free time and contributions from others help me make great tools.

Following these guidelines helps to communicate that you respect my time,
as the developer managing and developing this open source project.
In return, I should reciprocate that respect in addressing your issue,
assessing changes, and helping you finalize your pull requests.

Questions and pull requests are more than welcome.
I follow Elixir's tenet of bad documentation being a bug,
so if anything is unclear, please [file an issue](https://todo.sr.ht/~cosmicrose/spdx_cli)!
Ideally, my answer to your question will be in an update to the docs.

Please note that this project is released with a Contributor [Code of Conduct].
By participating in this project you agree to abide by its terms.

## Ground Rules

- Follow the [Code of Conduct].
- Keep your commits clear and your pull requests small.
  This isn't a big codebase.
- Run `mix format` on your files before committing them.
  I like clean diffs.
- Run `mix credo` and resolve anything of yours that comes up.
- All new files should have a copyright header stating your name and a license.
  Check out some of the other source files for an example.
  You can also use the [REUSE helper tool](https://github.com/fsfe/reuse-tool) to add headers for you.

You can run the entire CI pipeline on your own machine using [Earthly](https://earthly.dev):

```sh
earthly +all
```

## Your First Contribution

There are lots of ways to contribute to open source.
Check out the Open Source Guide on [How to Contribute to Open Source](https://opensource.guide/how-to-contribute)

- Ask questions!
I like writing good documentation, and questions make that work more meaningful.
Use the [mailing list] for questions or comments.
I promise I'll respond promptly.
- Tests and documentation are always welcome!

## Getting Started

There are two repositories hosting this project: [sourcehut](https://sr.ht/~cosmicrose/spdx_cli) and [GitHub](https://github.com/Cantido/spdx_cli).
You are welcome to contribute to either one; I keep both repositories up-to-date.

1. Create your own fork of the code
2. Do the changes in your fork
3. [Submit a pull request](https://github.com/Cantido/spdx_cli/compare)

You can also email a patch to the [mailing list] if you like things old-school.

I don't require a CLA or anything like that.
Just remember that this project is licensed under the [MIT License](LICENCES/MIT.txt),
and contributing to this project means you license your contribution under those same terms.

## How report a bug

If you find a security vulnerability, do NOT open an issue.
Contact [Rosa on keybase.io](https://keybase.io/cantido) instead!

In order to determine whether you are dealing with a security issue, ask yourself these two questions:

- Can I access something that's not mine, or something I shouldn't have access to?
- Can I disable something for other people?

If the answer to either of those two questions are "yes",
then you're probably dealing with a security issue.
Note that even if you answer "no" to both questions,
you may still be dealing with a security issue, so if you're unsure,
[message me directly](https://keybase.io/cantido).

Otherwise, please [open an issue](https://todo.sr.ht/~cosmicrose/spdx_cli).

## How to suggest a feature or enhancement

The philosopy of this project is to create a small, sharp tool that plays well with other tools,
and makes it easier for developers to use licenses for their work.
Feature requests and enhancements should stick to this philosophy.

Feature requests give meaning to my work.
[Open an issue](https://todo.sr.ht/~cosmicrose/spdx_cli) that decribes the feature you'd like to see,
why you need it, and how you'd like it to work.

## Code review process

As the primary developer, I will be the one reviewing all pull requests.
I'm online far too much, so you should be able to hear back from me quickly.
However, I only do this in my free time, so please allow me flexibility.

## Community

Participate in our [mailing list](https://lists.sr.ht/~cosmicrose/spdx_cli)!
This is a small project, but I care about the people that care about my work.
I'm also on [keybase](https://keybase.io/cantido) if you need to message me directly.

---
If you like this contribution guide, please give a star to [Nadia Eghbal]'s [`contributing-template`] project on GitHub.
It was a great help.

[Nadia Eghbal]: https://github.com/nayafia
[`contributing-template`]: https://github.com/nayafia/contributing-template
[mailing list]: https://lists.sr.ht/~cosmicrose/spdx_cli
[Code of Conduct]: code_of_conduct.md
