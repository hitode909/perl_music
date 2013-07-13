use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('sin.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data;
my @data;

while ( defined( $data = $read->read_raw_samples( 1 ) ) ) {
    push @data, $data;
}

my $v = 0;
my $hz = 30;
my $sampling_rate = 44100;
my $delta = $hz/$sampling_rate;
for my $data (map { unpack('s', $_) } @data) {
    $write->write_raw( pack('s', int($data * sin($v+=$delta)) ));
}

$write->finish();
