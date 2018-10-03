Class {
	#name : #PP2PatternTokenStrategy,
	#superclass : #PP2Strategy,
	#instVars : [
		'pattern',
		'ruleName'
	],
	#category : 'PetitParser2-RewriteEngine-Strategies'
}

{ #category : #'instance creation' }
PP2PatternTokenStrategy class >> new [
	^ self basicNew
]

{ #category : #parsing }
PP2PatternTokenStrategy >> parseOn: context [
    | start parseValue patternToken |
    start := context position.
    (parseValue := self pattern parseOn: context) isPetit2Failure ifTrue: [ ^ parseValue ].

    patternToken := (context newToken: PP2PatternToken from: start)
        name: parseValue second;
        yourself.
    self testBlock: parseValue into: patternToken.
    ^ patternToken
]

{ #category : #parsing }
PP2PatternTokenStrategy >> pattern [
	^ pattern ifNil: [ 
		pattern := self patternToken
	]
]

{ #category : #parsing }
PP2PatternTokenStrategy >> patternToken [
    ^ $` asPParser , #letter asPParser plus flatten,
        (${ asPParser , ((#any asPParser starLazy: $} asPParser) flatten) , $} asPParser) optional ,
		$` asPParser
]

{ #category : #private }
PP2PatternTokenStrategy >> testBlock: retval into: returnNode [
	| source |
	retval third isNil ifTrue: [ returnNode testBlock: [ :arg | true ]. ^ self ].
	
	"
		TODO JK: this does not seem to be correct. Check the beToken implementation in SmaCCPatternToken
			and implement beToken properly.
	"
	(retval third second = 'beToken') ifTrue: [ returnNode testBlock: [ :arg | arg isToken ]. ^ self ].

	source := 'self ' , retval third second.
	Compiler evaluate: source for: returnNode logged: false.
]
