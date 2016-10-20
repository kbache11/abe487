#!/usr/bin/env perl6

sub MAIN (Str $file!) {
  die "Not a file" unless $file.IO.f;
  my ($lineCount, $wordCount, $charCount) = (0, 0, 0);

  for $file.IO.lines -> $line {
    $lineCount++;
    $wordCount = $wordCount + $line.lc.words.elems;
    $charCount = $charCount + (1 + $line.chars);
  }

  put "lines ($lineCount) words ($wordCount) chars ($charCount)";  
}
