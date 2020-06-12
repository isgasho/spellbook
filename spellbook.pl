#!/usr/bin/env perl

use 5.018;
use strict;
use warnings;
use lib "./lib/";
use Core::Helper;
use Getopt::Long;
use Mojo::File;
use Mojo::JSON qw(decode_json);

sub main {
    my $modules = Mojo::File -> new(".config/modules.json");
    
    if ($modules) {
        my $list = $modules -> slurp();
        my $hash = decode_json($list);
        
        my ($show, $module, $target, $read);

        GetOptions (
            "--show=s" => \$show,
            "--module=s" => \$module,
            "--target=s" => \$target,
            "--read=s" => \$read,
            "" => \ Core::Helper -> new()
        );

        foreach my $package (@{$hash -> {"modules"}}) {
            if ($show) {
                if ($show eq "all") {
                    print "Module: ", $package -> {module}, "\n";
                    print "Category: ", $package -> {category}, "\n";
                    print "Description: ", $package -> {description}, "\n";
                    print "=================================================", "\n\n"
                }

                elsif ($show eq $package -> {category}) {
                    print "Module: ", $package -> {module}, "\n";
                    print "Category: ", $package -> {category}, "\n";
                    print "Description: ", $package -> {description}, "\n";
                    print "=================================================", "\n\n"
                }
            }

            if ($module) {
                if ($package -> {module} eq $module) {
                    my $location = $package -> {location};
                    
                    require $location;

                    my @run = "Modules::$module" -> new($target);

                    foreach my $result (@run) {
                        print $result;
                    }
                }

                return 1;
            }

            if ($read) {
                if ($package -> {module} eq $read) {
                    my $location = $package -> {location};
                    my $file = Mojo::File -> new("./lib/" . $location);
                    
                    print "\n", $file -> slurp(), "\n";
                }

                return 1;
            }            
        }
    }
}

main();