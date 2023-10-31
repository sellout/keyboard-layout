# [Infinity Ergodox](https://drop.com/buy/infinity-ergodox) keyboard layouts

Since these files are JSON, they don’t allow comments, so they’re described here.

These can be edited using the [Kiibohd Configurator](https://github.com/kiibohd/configurator).

## layouts

### Atreus

This maps various [Keyboardio Atreus](https://shop.keyboard.io/products/keyboardio-atreus)-oriented layouts to the Ergodox.

I use both the Infinity Ergodox and Atreus keyboards, so having layouts that correspond between the two is helpful for switching back and forth. Since the Atreus has fewer keys, it makes sense to define the layout for that primarily, then to replicate it here and possibly expand it to take advantage of the extra keys on the Ergodox.

The physical layouts don’t quite align, so here is the physical Atreus layout with the Ergodox key codes:

```
     board 0              board 1

10 0f 0e 0d 0c          0c 0d 0e 0f 10
19 18[17]16 15          15 16[17]18 19
22 21 20 1f 1e 1d    1d 1e 1f 20 21 22
2b 2a 29 28 27 1c    1c 27 28 29 2a 2b
```

The part to pay attention to is the thumb area – `1c`, `1d`, and `27`.

#### default

The default layout of the Atreus applied to the Infinity Ergodox. The only intentional difference from the Atreus default layout is that the `Flash` key is kept in its position (0/08/2) from the default Ergodox layout. This key doesn’t exist on the Atreus, so it should be relatively safe.

Another current (but unintentional) difference is that many of the Atreus symbol keys are mapped to standard number keys (where `Shift` is required to type the symbols). This is likely easy to remedy.

### blank

Not actually blank, but only the base layer of the default Ergodox layout.

### default

This is the default Infinity Ergodox layout. It’s also what I used before adding the Atreus to my repertoire.

## notes

### key code mapping

Each half-board has codes mapped from thumb to pinky (that is, mirrored on the left-hand board), indexed by board number. Here is a diagram of the left and right boards:

```
        board 0                    board 1

08 07 06 05 04 03 02          02 03 04 05 06 07 08
11 10 0f 0e 0d 0c 0b          0b 0c 0d 0e 0f 10 11
1a 19 18[17]16 15 --          -- 15 16[17]18 19 1a
23 22 21 20 1f 1e 1d          1d 1e 1f 20 21 22 23
2c 2b 2a 29 28    1c 1b    1b 1c    28 29 2a 2b 2c
               27 26 24    24 26 27
               __ __ 25    25 __ __
```

My preferred homing keys (middle finger rather than index) are called out with brackets. The more common index finger key would be next to it – code `16`.
