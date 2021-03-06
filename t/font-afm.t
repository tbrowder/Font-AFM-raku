use Test;
plan 7;

require ::('Font::AFM');

my $font;

lives-ok {
   $font = ::('Font::AFM').new: :name<Helvetica>
};

is $font.Weight, 'Medium', '$font.Weight accessor'; 

dies-ok {$font.Guff}, 'unknown method - dies';

my $sw = $font.stringwidth("Gisle Aas");
is $sw, 4279, 'Stringwidth for Helvetica';

$sw = $font.stringwidth("Gisle Aas", 12);
is-approx $sw, 4279 * 12 / 1000, 'Stringwidth with pointsize';



my $a = ::('Font::AFM').new: :name<Helvetica>;
my $b = ::('Font::AFM').new: :name<Courier>;

nok $a.IsFixedPitch, 'expect False, Helvetica is not monospaced';
ok  $b.IsFixedPitch, 'expect True, Courier is monospaced';

