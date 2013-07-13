use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('sort.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data;
my @data;

while ( defined( $data = $read->read_raw_samples( 1 ) ) ) {
    push @data, $data;
}

for my $data (sort { $a <=> $b } map { unpack('s', $_) } @data) {
    $write->write_raw( pack('s', $data));
}

$write->finish();
