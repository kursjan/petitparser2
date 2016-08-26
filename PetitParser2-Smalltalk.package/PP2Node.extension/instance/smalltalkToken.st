*PetitParser2-Smalltalk
smalltalkToken
	^ PP2TrimmingTokenParser new
		tokenClass: PP2SmalltalkToken;
		trimmer: PP2SmalltalkWhitespaceNode instance;
		parser: self;
		yourself	