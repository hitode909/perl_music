use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('reverse.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data;
my @data;

while ( defined( $data = $read->read_raw_samples( 1 ) ) ) {
    push @data, $data;
}

for my $data (reverse @data) {
    $write->write_raw( $data );
}

$write->finish();
