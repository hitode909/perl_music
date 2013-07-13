use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('fast.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data;
my @data;

while ( defined( $data = $read->read_raw_samples( 1 ) ) ) {
    push @data, $data;
}

my $i = 0;
for (@data) {
    $i++;
    if ($i % 2) {
        $write->write_raw( $_ );
    }
}

$write->finish();


