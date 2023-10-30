#!/usr/bin/perl -w

use strict;
use Dumpvalue;

# open xmodmap_universal and split it on ; then ,
my %source_tree;
open SOURCE, "<", "templates/Universal.xmodmap";
while (<SOURCE>) {
	my @values = split /\s*;\s*/;
	if (scalar(@values) == 2) {
		chomp $values[1];
		my @foo = split /\s*,\s*/, $values[1];
		$source_tree{$values[0]} = \@foo;
	}
}
close SOURCE;

mkdir "build";
my @dest_files = ("MAC.xmodmap", "PC.xmodmap", "SUN.xmodmap");

foreach my $file (@dest_files) {
	open SOURCE, "<", "platforms/" . $file;
	open DEST, ">", "build/" . $file;

	print DEST <<EOF;
! Universal.xmodmap file generated as a part of the Universal keymap project.
!
! You should replace "currency" with your local currency symbol, or if your
! local currency is already listed, some other useful currency symbol.
! Also, you will need to set up a Multi_key.
!
! If you have any problems, please contact keyboard-project\@technomadic.org

EOF
	while (<SOURCE>) {
		my @values = split /\s*;\s*/;
		if (scalar(@values) == 2) {
			chomp $values[1];
			print DEST "keycode " . $values[1] . " = "
			           . join(" ", @{$source_tree{$values[0]}})
			           . "\n";
		}
	}
}
