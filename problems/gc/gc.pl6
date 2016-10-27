#!/usr/bin/env perl6


sub MAIN (Str $file!, :$threshold=0.3) {
    die "Not a file ($file)" unless $file.IO.f;
    
    my $firstChar = "null";
    my $newSRR = "null";
    my $gcConc = 0.0;
    my $identity = "null";
    my $totalCount = 0.0;
    my $gcCount = 0.0;
    my $gcCheck = "null";
  
    for $file.IO.lines -> $line {

      $firstChar = $line.substr(0, 1);

      if ($firstChar ~~ ">") {
        $newSRR = "Yes";
        $totalCount = 0;
        $gcCount = 0;
      } else {
        $newSRR = "No";
        for $line.comb -> $gcCheck {
          if ($gcCheck ~~ "G" || $gcCheck ~~ "C") {
            $gcCount = $gcCount + 1;
          }
        }
        $totalCount = $line.chars;
      }

      if ($newSRR ~~ "No") {
        $gcConc = $gcCount/$totalCount;
        if ($gcConc >= $threshold) {
          $identity = "burkholderia";
        } else {
          $identity = "anthrax";
        }
        $gcConc = sprintf '%.2f', $gcConc;
        put $gcConc ~ ': ' ~ $identity;
      }

    }
}
