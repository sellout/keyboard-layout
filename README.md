# keyboard layout

[![built with garnix](https://img.shields.io/endpoint?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Fsellout%2Fkeyboard-layout)](https://garnix.io)

Various hardware and software keyboard layouts

This currently only works with Mac OS X and Unix. It doesn't work with Windows because the files aren’t plain text, and I haven't yet been able to find a free library to generate the files. If there are any other systems that I can be generating files for, please let me know.

The two files to keep updated are Universal.xmodmap and Universal.keylayout. Try to reflect changes in both, although keylayout is
more complete because the format allows for more specification.

generate_xmodmap.pl creates all the actual xmodmap files from the
Universal.xmodmap and the platform specific files.

Eventually, there should be one file that produces all the output files (xmodmap, keylayout, and whatever Windows uses).

For the most part, when typing diacritics the order doesn't matter. However,
with macron+diaeresis+[U|u], the order is important (two different chars).
Also, there is some confusion as to the use of the stroke and bar
diacritics. Some things labeled with stroke in Unicode have a horizontal
stroke, others angled. The bar is always horizontal. The way to generate
certain characters is thus negotiable. I don't know enough about the
characters involved to make an informed decision.

You can enter any character with no more than three key sequences (two
diacritics). All primary characters require no more than two key
sequences (one diacritic).

Hopefully, most of the sequences are intuitive.

Note: In OS X, use KeyCaps to experiment with the key layout. It'll show you the layout, and it will show you the available characters after you've typed a diacritic.

Here is how to see the character set we support:

```bash
perl -e 'while ($_ = <>) { /output="(.*?)"/; print "$1\n" }' Universal—Dvorak.keylayout \
  | sort \
  | uniq
```

Add dead key sequences like 1,ropt-uparrow to get ¹ (superscript 1) and 1,ropt-downarrow to get ₁ (subscript 1)

## development

We recommend the following steps to make working in this repository as easy as possible.

### Nix users

#### `direnv allow`

This command ensures that any work you do within this repository happens within a consistent reproducible environment. That environment provides various debugging tools, etc. When you leave this directory, you will leave that environment behind, so it doesn’t impact anything else on your system.

#### `project-manager switch`

This is sort-of a catch-all for keeping your environment up-to-date. It regenerates files, wires up the project’s Git configuration, ensures the shells have the right packages, configured the right way, enables checks & formatters, etc.

### non-Nix users

## building & development

Especially if you are unfamiliar with the default ecosystem, there is a flake-based Nix build. If you are unfamiliar with Nix, [Nix adjacent](...) can help you get things working in the shortest time and least effort possible.

### if you have `nix` installed

`nix build` will build and test the project fully.

`nix develop` will put you into an environment where the traditional build tooling works. If you also have `direnv` installed, then you should automatically be in that environment when you're in a directory in this project.

## versioning

In the absolute, almost every change is a breaking change. This section describes how we mitigate that to offer minor updates and revisions.

## comparisons

Other projects similar to this one, and how they differ.
