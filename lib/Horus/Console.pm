#!/usr/bin/perl

#########################################################
# Horus developed by Heitor Gouvea                      #
# This work is licensed under MIT License               #
# Copyright (c) 2016 Heitor Gouvea                      #
#                                                       #
# [+] AUTOR:        Heitor Gouvea                       #
# [+] EMAIL:        hi@heitorgouvea.me                  #
# [+] GITHUB:       https://github.com/GouveaHeitor     #
# [+] TWITTER:      https://twitter.com/GouveaHeitor    #
# [+] FACEBOOK:     https://fb.com/GouveaHeitor         #
#########################################################

package Horus::Console;

use Switch;
use Horus::Framework::Functions;

my ($command, @commands);

sub new {
	my $func = Horus::Framework::Functions;

	print "\n\033[1;32m➜ \033[1;37m horus> ";
	chomp ($command = <STDIN>);

	@commands = split (/ /, $command);

	switch ($commands[0]) {
		case ""       { new(); }
		case "?"      { $func -> help(); }
		case "help"   { $func -> help(); }
		case "exit"   { $func -> quit(); }
		case "quit"   { $func -> quit(); }
		case "set"    { $func -> set(); }
		case "start"  { $func -> start(); }
		case "search" { $func -> search(); }
		case "clear"  { $func -> clear(); }
		else { $func -> error(); }
	}
}

1;