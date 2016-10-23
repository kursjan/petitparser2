initialization
initialize
	CharacterTable := Dictionary new.
	CharacterTable
		at: $\ put: $\;
		at: $/ put: $/;
		at: $" put: $";
		at: $b put: Character backspace;
		at: $f put: Character newPage;
		at: $n put: Character lf;
		at: $r put: Character cr;
		at: $t put: Character tab