use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('distortion.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data;
my @data;

while ( defined( $data = $read->read_raw_samples( 1 ) ) ) {
    push @data, $data;
}

my $max = 1<<15;
for my $data (map { unpack('s', $_) } @data) {
    $data *= 2;
    $data = 0 if $data > $max;
    $data = 0 if $data < -$max;
    $write->write_raw( pack('s', $data) );
}

$write->finish();
