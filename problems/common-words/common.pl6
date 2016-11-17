#!/usr/bin/env perl6

sub MAIN (Str $file1!, Str $file2!) {
   die "Not two files" unless $file1.IO.f && $file2.IO.f;
   
   my @newf1;
   my @newf2;
   my @shortF;
   my @longF;
   my @ignoreWords;

   my $i = 0;

   my $intermediate;
   my $short;
   my $currWord;
   my $commWords = 0;

   for $file1.IO.words -> $line {
      $intermediate = $line.subst(',', '', :g);
      @newf1[$i] = $intermediate.subst(/<-[\w\s,]>/, '', :g).words.lc;
      $i++;
   }
   $i = 0;
   for $file2.IO.words -> $line {
      $intermediate = $line.subst(',', '', :g);
      @newf2[$i] = $intermediate.subst(/<-[\w\s,]>/, '', :g).words.lc;
      $i++;
   }

   if (@newf1.elems < @newf2.elems) {
      $short = @newf1.elems;
      @shortF = @newf1;
      @longF = @newf2;
   } else {
      $short = @newf2.elems;
      @shortF = @newf2;
      @longF = @newf1;
   }

   loop ($i = 0; $i < $short; $i++) {
      $currWord = @shortF[$i];
      if (any(@ignoreWords) eq $currWord) {
 
      } elsif (any(@longF) eq $currWord) && !($currWord eq '') {
         $commWords++;
      }   
      @ignoreWords[$i] = $currWord;
   }
   
   put $commWords;

}
