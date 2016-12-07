#!/usr/bin/perl

inicio();

sub inicio {
	open(IN,"uno.txt");
	my @DATA=<IN>;
	close(IN);
	open(OUT,">salida.txt");
	
	foreach my $line (@DATA) {
		chomp($line);
		$line =~s/ +/ /gi;
		$line =~s/^ +//gi;
		($campo, $tipo) = $line =~/^\d+\s(.+?)\s(.+?).*/g;
		$tipo = "String" if($tipo eq "C");
		$tipo = "Integer" if($tipo eq "N");
		$tipo = "Date" if($tipo eq "F");
		print "Line: -->$line<--\n";
		print "Campo: $campo\n";
		print "TIPO: $tipo\n";
		$datos = $campo.":".$tipo.",";
		print OUT "$datos\n";
	}
	#print OUT "$datos\n";
	close(OUT);
}