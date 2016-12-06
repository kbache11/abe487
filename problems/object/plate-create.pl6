#!/usr/bin/env perl6

class CellPlate {
  has Str $.plate_name is required;
  has Str $.location;
  has Str $.barcode is required;
  method move_plate (Str $a) { $!location = $a}
}

my $plate1 = CellPlate.new(plate_name => 'Cells 1', barcode => 'C1Dec2016');
$plate1.move_plate('Position 1');

put $plate1.plate_name ~ ' is at ' ~ $plate1.location ~ ' with barcode ' ~ $plate1.barcode ~ '.';
