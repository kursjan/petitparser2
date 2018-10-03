"
TODO(JanKurs): I wonder what is the value of this class... except for a purely experimental purposes.
"
Class {
	#name : #PP2Interpret,
	#superclass : #PP2NodeVisitor,
	#instVars : [
		'currentContext',
		'rootParser'
	],
	#category : 'PetitParser2-Experiments-Interpret'
}

{ #category : #'as yet unclassified' }
PP2Interpret class >> on: aPP2Parser [
	^ (self basicNew)
		initializeFor: aPP2Parser;
		yourself
]

{ #category : #'visiting - helpers' }
PP2Interpret >> discardFailure [
	currentContext :=	currentContext success
]

{ #category : #intializing }
PP2Interpret >> initializeFor: aPP2Parser [
	rootParser := aPP2Parser
]

{ #category : #'newline handling' }
PP2Interpret >> insideCRLF: context [
    context position < 1 ifTrue: [ ^ false ].

    ^ context peek = (Character codePoint: 10)
        and: [ context peekBack = (Character codePoint: 13) ]
]

{ #category : #'newline handling' }
PP2Interpret >> isEndOfLine: context [
    context atEnd ifTrue: [ ^ true ].
    (self insideCRLF: context) ifTrue: [ ^ false ].

    ^ context peek = (Character codePoint: 13)
        or: [ context peek = (Character codePoint: 10) ]
]

{ #category : #'newline handling' }
PP2Interpret >> isStartOfLine: context [
    context position = 0 ifTrue: [ ^ true ].
    (self insideCRLF: context) ifTrue: [ ^ false ].

    ^ context peekBack = (Character codePoint: 13)
        or: [ context peekBack = (Character codePoint: 10) ]
]

{ #category : #parsing }
PP2Interpret >> parse: input [
	| startContext |
	startContext := input asPetit2Context.
	^ self parseWithContext: startContext

]

{ #category : #parsing }
PP2Interpret >> parse: input withContext: startContext [
	startContext stream: input asPetit2Stream.
	startContext position: 0.
	startContext parser: rootParser.
	
	^ self parseWithContext: startContext
]

{ #category : #parsing }
PP2Interpret >> parseWithContext: startContext [
	| retval |
	currentContext := startContext.
	retval := self visit: rootParser.
	
	^ retval isPetit2Failure ifTrue: [ retval ] ifFalse: [ currentContext returnValue: retval; yourself ]
		
]

{ #category : #visiting }
PP2Interpret >> visitAction: parser [
	| retval |
	^ (retval := self visit: parser child) isPetit2Failure 
		ifTrue: [ ^ retval ]
		ifFalse: [ ^ parser block value: retval ]
]

{ #category : #visiting }
PP2Interpret >> visitAnd: parser [
	| retval memento |
	memento := currentContext remember.
	
	retval := self visit: parser child. 
	currentContext restore: memento.
	
	^ retval isPetit2Success
		ifTrue: [ retval ]
		ifFalse: [ PP2Failure message: retval message context: currentContext ]
		
]

{ #category : #visiting }
PP2Interpret >> visitChoice: parser [
	| retval |
	
	1 to: parser children size do: [ :index |
		(retval := self visit: (parser childAt: index)) isPetit2Success ifTrue: [ ^ retval ] 
	].
	
	^ retval
]

{ #category : #visiting }
PP2Interpret >> visitComposite: node [
	^ self visit: node child
]

{ #category : #visiting }
PP2Interpret >> visitDelegate: parser [
	^ self visit: parser child
]

{ #category : #visiting }
PP2Interpret >> visitEnd: parser [
	| memento retval |
	
	memento := currentContext remember.
	retval := self visit: parser child.

	^ currentContext atEnd 
		ifTrue: [ retval ] 
		ifFalse: [ 
			retval := PP2Failure message: 'end of input expected' context: currentContext.
			currentContext restore: memento.
			^ retval
		]
]

{ #category : #visiting }
PP2Interpret >> visitEndOfInput: parser [
    ^ currentContext atEnd
        ifTrue: [ nil ]
        ifFalse: [ PP2Failure message: 'end of input expected' context: currentContext ]
]

{ #category : #visiting }
PP2Interpret >> visitEndOfLine: parser [
    ^ (self isEndOfLine: currentContext)
        ifTrue: [ ^ nil ]
        ifFalse: [ PP2Failure message: 'end of line expected' context: currentContext ]
]

{ #category : #visiting }
PP2Interpret >> visitEpsilon: parser [
	^ nil
]

{ #category : #visiting }
PP2Interpret >> visitFailing: parser [
	^ PP2Failure message: parser message context: currentContext
]

{ #category : #visiting }
PP2Interpret >> visitFlatten: parser [
	| start result |
	start := currentContext position.
	(result := self visit: parser child) isPetit2Failure ifTrue: [ ^ result ].

	^ currentContext copyFrom: start + 1 to: (currentContext position)
]

{ #category : #visiting }
PP2Interpret >> visitFragment: parser [
	| start retval |
	start := currentContext remember.
	(retval := self visit: parser child) isPetit2Failure ifTrue: [ ^ retval ].

	^ currentContext copy 
		returnValue: retval;
		startMemento: start;
		parser: parser;
		yourself
]

{ #category : #visiting }
PP2Interpret >> visitLiteralObject: parser [
	^ (currentContext atEnd not and: [ parser literal = currentContext uncheckedPeek ])
		ifFalse: [ PP2Failure message: parser message context: currentContext ]
		ifTrue: [ currentContext uncheckedNext ]
]

{ #category : #visiting }
PP2Interpret >> visitLiteralSequence: parser [
	| memento retval |
	memento := currentContext remember.
	retval := currentContext next: parser size.
	parser literal = retval ifTrue: [ ^ retval ].

	currentContext restore: memento.
	^ PP2Failure message: parser message context: currentContext
]

{ #category : #visiting }
PP2Interpret >> visitMapping: parser [
	| retval |
	^ (retval := self visit: parser child) isPetit2Failure 
		ifTrue: [ ^ retval ]
		ifFalse: [ ^ parser block valueWithArguments: retval asOrderedCollection ]
]

{ #category : #visiting }
PP2Interpret >> visitNewLine: parser [
	currentContext atEnd ifTrue: [ 
		^ PP2Failure message: 'I was not expected to pass' context: currentContext 
	].

    currentContext uncheckedPeek == Character lf ifTrue: [ 
		  currentContext shift.
        ^ String lf
    ].

	(currentContext uncheckedPeek == Character cr) ifTrue: [ 
		currentContext shift.
		(currentContext peek == Character lf) ifTrue: [ 
			currentContext shift.
			^ String crlf
       ].
       ^ String cr
	].

    ^ PP2Failure message: 'I was not expected to pass' context: currentContext
]

{ #category : #visiting }
PP2Interpret >> visitNot: parser [
	| retval memento |
	memento := currentContext remember.
	
	retval := self visit: parser child.
	currentContext restore: memento.
	
	^ retval isPetit2Failure 
		ifTrue: [ nil ]
		ifFalse: [ PP2Failure message: 'I was not expected to pass' context: currentContext ]
]

{ #category : #visiting }
PP2Interpret >> visitOptional: parser [
	| retval memento |
	memento := currentContext remember.
	
	^ (retval := self visit: parser child) isPetit2Failure 
		ifTrue: [ currentContext restore: memento. nil ]
		ifFalse: [ retval ]
]

{ #category : #visiting }
PP2Interpret >> visitPP2Node: aPP2Parser [
	self error: 'should not happen'
]

{ #category : #visiting }
PP2Interpret >> visitPluggable: parser [
	^ parser block value: currentContext
]

{ #category : #visiting }
PP2Interpret >> visitPossesiveRepeating: parser [
	| memento elements retval |
	elements := OrderedCollection new.
	memento := currentContext remember.
	
	[ elements size < parser min ] whileTrue: [
		(retval := self visit: parser child) isPetit2Failure ifTrue: [
			currentContext restore: memento.
			"^ PP2Failure message: 'not enough repetitions' context: currentContext."
			^ retval
		].
		elements addLast: retval 
	].
	
	[ elements size < parser max ] whileTrue: [
	 	(retval := self visit: parser child) isPetit2Failure ifTrue: [ 
			^ elements 
		].
		elements addLast: retval 
	].

	^ elements
]

{ #category : #visiting }
PP2Interpret >> visitPredicateObject: parser [
	^ (currentContext atEnd not and: [ parser predicate value: currentContext uncheckedPeek ])
		ifFalse: [ PP2Failure message: parser predicateMessage context: currentContext  ]
		ifTrue: [ currentContext uncheckedNext ]
]

{ #category : #visiting }
PP2Interpret >> visitPredicateSequence: parser [
	| retval position |
	position := currentContext position.
	retval := currentContext next: parser size.
	
	^ (retval isNil not and: [ parser predicate value: retval ]) 
		ifTrue: [ retval ]
		ifFalse: [ 
			currentContext position: position.
			PP2Failure message: parser predicateMessage context: currentContext 
		]
]

{ #category : #visiting }
PP2Interpret >> visitSequence: parser [
	| retval elements memento |

	memento := currentContext remember.
	elements := Array new: parser children size.
	
	1 to: elements size do: [ :index |
		retval := self visit: (parser childAt: index).
		retval isPetit2Failure ifTrue: [ 
			currentContext restore: memento. 
			^ retval
		].
		elements at: index put: retval 
	].
	
	^ elements
]

{ #category : #'visiting - extras' }
PP2Interpret >> visitSmalltalkWhitespace: node [	
	[ 
		[ currentContext atEnd not and: [ currentContext uncheckedPeek isSeparator ]] whileTrue: [ 
			currentContext shift 
		].
	
		(currentContext atEnd not and: [ currentContext uncheckedPeek = $" ]) 
	] whileTrue: [
		currentContext shift.
		currentContext upTo: $".
	].

]

{ #category : #visiting }
PP2Interpret >> visitStartOfLine: parser [
    ^ (self isStartOfLine: currentContext)
        ifTrue: [ ^ nil ]
        ifFalse: [ PP2Failure message: 'start of line expected' context: currentContext ]
]

{ #category : #visiting }
PP2Interpret >> visitToken: parser [
	| start token retval |
	start := currentContext position.
	(retval := self visit: parser child) isPetit2Failure ifTrue: [ ^ retval ].

	token :=	currentContext newToken: (parser tokenClass) from: start.
	^ token
]

{ #category : #visiting }
PP2Interpret >> visitTrimming: parser [
	| memento retval |
	memento := currentContext remember.
	self visit: parser trimmer.
	
	(retval := self visit: parser child) isPetit2Failure ifTrue: [ 
		currentContext restore: memento.
		^ retval
	].
	
	self visit: parser trimmer.

	^ retval
]

{ #category : #visiting }
PP2Interpret >> visitWrapping: parser [
	^ parser block value: currentContext value: [ self visit: parser child  ]
]
