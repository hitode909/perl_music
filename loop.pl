use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read('input.wav');
my $write = $wav->write('loop.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );

my $data, $chunk, $i;
while (++$i < 500) {
    $data = $read->read_raw_samples(50);
    $chunk .= $data;
    $write->write_raw($chunk);
    $chunk = '' if rand() < 0.01;
}

$write->finish();
