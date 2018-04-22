running
setUp
	context := PP2Context on: 'foobar'.
	buffer := IdentityDictionary new.
	change := PP2DeleteCharacter new.
	memento := PP2Memento new.