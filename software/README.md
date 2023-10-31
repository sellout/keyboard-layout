# software keyboard layouts

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
