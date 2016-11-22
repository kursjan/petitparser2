private
node
	^ (thisContext findContextSuchThat: [ :ctxt | (ctxt receiver isKindOf: PP2AbstractStrategy)])
		ifNil: [ nil ]
		ifNotNil: [ :aContext |
			aContext receiver node
		].	
