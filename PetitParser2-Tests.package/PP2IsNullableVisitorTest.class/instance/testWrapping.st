tests
testWrapping
	parser := $a asParser2 >=> [ :c :cc | cc value ].

	self denyIsNullable: parser
