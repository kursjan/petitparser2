tests
testWrapping
	| wrapped |
	wrapped := $a asParser2 >=> [ :context :cc | cc value ].
	self denyNeverFails: wrapped
