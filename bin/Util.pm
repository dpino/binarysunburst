#!/usr/bin/perl

package Util;

use strict;
use Exporter;

our @ISA = qw(Exporter);

our @EXPORT = qw(parse_args readfile writefile error);
our @EXPORT_OK = qw(parse_args readfile writefile error);

sub parse_args
{
    my $nm = "nm.out"; 
    my $output_dir = "output";
    my $title = "";
    my $help = 0;

    while (@_) {
        my $arg = shift;
        if ($arg =~ /--nm-output/) {
            $nm = shift;
        }
        if ($arg =~ /--output-dir/) {
            $output_dir = shift;
        }
        if ($arg =~ /--title/) {
            $title = shift;
        }
        if ($arg =~ /--help/) {
            $help = 1;
        }
    }
    return ($title, $nm, $output_dir, $help);
}

sub error
{
    my($str) = @_;
    print "$str\n";
}

sub readfile
{
    my($filename) = @_;

    my $content = do {
        local $/ = undef;
        open FILE, "<$filename";
        <FILE>
    };
    return $content;
}

sub writefile
{
    my($content, $filename) = @_;

    open FILE, ">$filename";
    print FILE $content;
    close FILE;
}

1;
