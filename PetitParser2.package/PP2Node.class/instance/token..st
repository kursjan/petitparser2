operators
token: tokenClass
	^ (PP2TokenNode on: self)
		tokenClass: tokenClass;
		yourself