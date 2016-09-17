tests
testWrapping
	parser := $a asPParser >=> [ :c :cc | cc value ].

	self denyIsNullable: parser
