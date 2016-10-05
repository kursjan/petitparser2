*PetitParser2-Smalltalk
smalltalkToken
"	^ PP2TrimmingTokenNode new
		tokenClass: PP2SmalltalkToken;
		trimmer: PP2SmalltalkWhitespaceNode instance;
		child: self;
		yourself	"
	^ (self token: PP2SmalltalkToken) trim: PP2SmalltalkWhitespaceNode instance