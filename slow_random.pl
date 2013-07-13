use Audio::Wav;
use List::Util qw(shuffle);
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('output.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data;
my @data;

while ( defined( $data = $read->read_raw_samples( 1 ) ) ) {
    push @data, $data;
}

for my $data (@data) {
    $write->write_raw( $data ) while rand > 0.25;
}

$write->finish();
