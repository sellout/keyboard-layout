This currently only works with Mac OS X and Unix. It doesn't work with Windows because the files are not plain text, and I haven't yet been able to find a free library to generate the files. If there are any other systems that I can be generating files for, please let me know.

The two files that have to be maintained are Universal.xmodmap and Universal.keylayout. Try to reflect changes in both, although keylayout is
more complete because the format allows for more specification.

generate_xmodmap.pl creates all the actual xmodmap files from the
Universal.xmodmap and the platform specific files.

Eventually, there should be one file where everything is maintained and all
the actual files (xmodmap, keylayout, and whatever Windows uses) are built from
it.

For the most part, when typing diacriticals the order doesn't matter; however,
with macron+diaeresis+[U|u], the order is important (two different chars).
Also, there is some confusion as to the use of the stroke and bar
diacriticals. Some things labeled with stroke in Unicode have a horizontal
stroke, others angled. The bar is always horizontal. The way to generate
certain characters is thus negotiable. I don't know enough about the
characters involved to make an informed decision.

Every character can be typed with no more than three key sequences (two
diacriticals). All primary characters can be typed with no more than two key
sequences (one diacritical).

Hopefully, most of the sequences are fairly intuitive.

Note: In OS X, use KeyCaps to experiment with the key layout. It'll show you the layout, and it will show you the available characters after you've typed a diacritical.

Here is how to see the character set we support:
perl -e 'while ($_ = <>) { /output="(.*?)"/; print "$1\n" }' Universal—Dvorak.keylayout|sort

unfortunately, adding `uniq` after `sort` ends up eliminating most of the characters for some reason. Need to figure out why.

Add dead key sequences like 1,ropt-uparrow to get ¹ (superscript 1) and 1,ropt-downarrow to get ₁ (subscript 1)

