private
strategy
	^ (thisContext findContextSuchThat: [ :ctxt | (ctxt receiver isKindOf: PP2Strategy)])
		ifNil: [ PP2NilStrategy new ]
		ifNotNil: [ :aContext | aContext receiver ].	
