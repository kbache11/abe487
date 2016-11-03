#!/usr/bin/env perl6

sub MAIN (Str $s1!, Str $s2!) {
    my $lengthDifference = abs($s1.chars - $s2.chars);
    my $hammingDistance = $lengthDifference;
    my $s1Short;
    my $s2Short;
    my @s1List;
    my @s2List;

    if $s1.chars > $s2.chars {
      $s1Short = substr($s1, 0, $s2.chars).lc;
      $s2Short = $s2.lc;
    } else {
      $s2Short = substr($s2, 0, $s1.chars).lc;
      $s1Short = $s1.lc;
    }

    my $i = 0;

    for $s1Short.comb -> $ignore {
      if $s1Short.comb[$i] ~~ $s2Short.comb[$i] {

      } else {
         $hammingDistance++;
      }

      $i++;
    }

    put $hammingDistance;
}
