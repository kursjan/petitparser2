operators
token: tokenClass
	^ (PP2CreateTokenNode on: self)
		tokenClass: tokenClass;
		yourself