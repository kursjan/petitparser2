tests
testWrappingSetProperty
	parser := $a asPParser >=> [ :ctx :cc | cc value ]
		contextChanges: PP2CcChange noChange;
		yourself.
	
	 self denyChangesContext: parser