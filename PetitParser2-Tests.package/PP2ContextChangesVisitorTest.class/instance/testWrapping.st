tests
testWrapping
	parser := $a asPParser >=> [ :ctx :cc | cc value ].
	
	self assertChangesContext: parser