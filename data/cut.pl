use Audio::Wav;
my $wav = new Audio::Wav;
my $read = $wav->read( 'original.wav' );
my $write = $wav->write( 'input.wav', $read->details() );

$write->set_info( 'software' => 'Audio::Wav' );
my $data;

my $i = 0;
while ( defined( $data = $read->read_raw( 512 ) ) ) {
    $i++;
    if (10000 < $i && $i < 12000) {
        $write->write_raw( $data );
    }
}

$write->finish();
