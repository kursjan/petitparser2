private
selector
	^ (thisContext findContextSuchThat: [ :ctxt | (ctxt receiver isKindOf: PP2Node)])
		ifNil: [ nil ]
		ifNotNil: [ :aContext |
			aContext receiver
		].	
