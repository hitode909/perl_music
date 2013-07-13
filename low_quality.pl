use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('low_quality.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data;
my @data;

while ( defined( $data = $read->read_raw_samples( 1 ) ) ) {
    push @data, $data;
}

my $size = 20;
my $i = 0;
for my $data (@data) {
    $i++;
    if ($i % $size == 0) {
        $write->write_raw( $data ) for (0..$size);
    }
}

$write->finish();
