"
This strategy is a longest-match choice that will choose between pattern token for rewrite rules (usually `a` or the original parse tree).

If both, token and parse tree match, the longest match is prefered. (JK: I am not sure, if this is correct behaviour, any suggestions for improvements are welcome).
"
Class {
	#name : #PP2PatternStrategy,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'patternTokenStrategy'
	],
	#category : 'PetitParser2-RewriteEngine-Strategies'
}

{ #category : #parsing }
PP2PatternStrategy >> parseOn: context [
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
]

{ #category : #accessing }
PP2PatternStrategy >> patternTokenStrategy [
	patternTokenStrategy ifNil: [ 
		patternTokenStrategy := PP2PatternTokenStrategy new
	].
	^ patternTokenStrategy 
]
