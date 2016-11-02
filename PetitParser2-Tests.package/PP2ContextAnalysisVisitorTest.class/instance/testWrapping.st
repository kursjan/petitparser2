as yet unclassified
testWrapping
	parser := $a asPParser >=> [ :ctx :cc | cc value ].
	
	self assertChangesContext: parser