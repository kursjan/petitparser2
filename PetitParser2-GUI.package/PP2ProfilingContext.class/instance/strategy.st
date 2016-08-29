private
strategy
	^ (thisContext findContextSuchThat: [ :ctxt | (ctxt receiver isKindOf: PP2Strategy)])
		ifNil: [ nil ]
		ifNotNil: [ :aContext |
			aContext receiver
		].	
