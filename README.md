# keyboard layout

[![built with garnix](https://img.shields.io/endpoint?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Fsellout%2Fkeyboard-layout)](https://garnix.io)

Various keyboard layouts that I use and/or have designed. There are both layouts for physical keyboards and software layouts.

In general, the physical keyboard layouts are minimal. They’re intended to align the keyboards with each other and allow the software layouts to consistently reconfigure them to be used as intended.

However, there are exceptions:

- “support” layouts expect the software to be configured with standard QWERTY layouts and do all the remapping in the keyboard. This allows me the best chance to get _my_ layout when I plug my keyboard into a random computer.
- sometimes keys that seem re-arrangeable on one layout aren’t on another. For example, QWERTY `-` and `=` are mapped to Dvorak `[` and `]`. This is fine on a standard 104-key keyboard, but on the default Infinity Ergodox layout, `=` is on the far left and `-` is on the far right. When used with software Dvorak, this means that `[` and `]` aren’t only far apart, but reversed (with `]` on the left and `[` on the right).

## physical keyboards I’ve used

This isn’t comprehensive, but captures the most notable ones. The **emphasized** entries have layouts defined here.

- [IBM Model M](https://en.wikipedia.org/wiki/Model_M_keyboard)
- [Twiddler](https://twiddler.tekgear.com/)
- [Happy Hacking II](https://hhkeyboard.us/hhkb/Pro-Classic)
- [Kinesis Advantage](https://kinesis-ergo.com/shop/advantage2/)
- **[Infinity Ergodox](https://drop.com/buy/infinity-ergodox)**
- **[Atreus](https://shop.keyboard.io/products/keyboardio-atreus)**

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
