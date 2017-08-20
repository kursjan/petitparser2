parsing
parseOn: context
	| retval memento tokenEndPosition patternToken |
	"TODO JK: avoid instance creation"
	memento := self remember: context.
	patternToken := PP2RewritePatternTokenStrategy new 
		name: node nodeName;
		parseOn: context.
	tokenEndPosition := context position.
	context position: memento position.

	retval := node child parseOn: context.

	(patternToken isPetit2Success) ifTrue: [
		(retval isPetit2Success) ifTrue: [  
			"return furthest match"
			(context position > tokenEndPosition) ifTrue: [ 
				^ PP2ParseNode new
					children: retval asCollection;
					startPosition: memento position + 1;
					stopPosition: context position;
					name: node nodeName;
					yourself
			] ifFalse: [ 
				"we will not return the childs result, restore"
				context restore: memento.
			].
		].
	
		context position: tokenEndPosition.
		^ PP2PatternParseNode new
				patternToken: patternToken;
				name: node nodeName;
				yourself	
	].
	
	retval isPetit2Failure ifTrue: [ ^ retval ].
	^ PP2ParseNode new
		children: retval asCollection;
		startPosition: memento position + 1;
		stopPosition: context position;
		name: node nodeName;
		yourself