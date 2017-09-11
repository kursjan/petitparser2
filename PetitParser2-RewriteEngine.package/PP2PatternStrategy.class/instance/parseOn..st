parsing
parseOn: context
	| retval memento tokenEndPosition patternToken |

	memento := self remember: context.
	patternToken := self patternTokenStrategy parseOn: context.
	tokenEndPosition := context position.
	context position: memento position.

	retval := strategy parseOn: context.

	(patternToken isPetit2Success) ifTrue: [
		(retval isPetit2Success) ifTrue: [  
			"return furthest match"
			(context position > tokenEndPosition) ifTrue: [ 
				^ retval
			] ifFalse: [ 
				"we will not return the childs result, restore"
				context restore: memento.
			].
		].
	
		"move to the end of the token"
		context position: tokenEndPosition.
		^ PP2PatternParseNode new
			patternToken: patternToken;
			name: self node nodeName;
			yourself	
	].
	
	^ retval