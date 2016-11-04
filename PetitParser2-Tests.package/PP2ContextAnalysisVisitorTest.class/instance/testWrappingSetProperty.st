tests
testWrappingSetProperty
	parser := $a asPParser >=> [ :ctx :cc | cc value ]
		contextChanges: PP2CaChange noChange;
		yourself.
	
	 self denyChangesContext: parser