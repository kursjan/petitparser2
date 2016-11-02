as yet unclassified
testWrappingSetProperty
	parser := $a asPParser >=> [ :ctx :cc | cc value ]
		changesContext: false;
		yourself.
	
	 self denyChangesContext: parser