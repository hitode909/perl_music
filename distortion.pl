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

my $threshold = 1<<16 * 0.8;
for my $data (map { unpack('s', $_) } @data) {
    $data = $threshold if  $data > ($threshold);
    $data = -$threshold if  $data < -($threshold);
    $write->write_raw( pack('s', $data) );
}

$write->finish();
