"
This is highly experimental feature, please ignore.

If you are interested though, feel free to reach to me!
"
Class {
	#name : #PP2Reparsable,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'buffer'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #accessing }
PP2Reparsable >> buffer [
	^ buffer
]

{ #category : #accessing }
PP2Reparsable >> buffer: anObject [
	buffer := anObject
]

{ #category : #conversion }
PP2Reparsable >> cache [
	^ self
]

{ #category : #'as yet unclassified' }
PP2Reparsable >> displayName [
	^ super displayName, '#', self identityHash asString
]

{ #category : #initialization }
PP2Reparsable >> initialize [
	super initialize.
	
	self reset
]

{ #category : #testing }
PP2Reparsable >> isCache [
	^ true
]

{ #category : #testing }
PP2Reparsable >> isReparsable [
	^ true
]

{ #category : #parsing }
PP2Reparsable >> parseOn: context [
	| memento mementoPromise |

	mementoPromise := buffer at: context position ifAbsentPut: [ 
		PP2MementoPromise new
			position: context position;
			buffer: buffer;
			yourself
	].

	memento := mementoPromise resolveFor: strategy in: context.
	context restore: memento contextMemento.

	^ memento returnValue
	
	"
		The code might be a bit of magic, because it handles 'reparses':
			1) In case of the first parse, a MementoPromise is crated and immediately resolved.
			2) In case of a reparse after a change in input, an PP2InputChange puts a mementoPromise 
				to the buffer with a limit. If parser during the resolve does not fit the limit, an
				exception is raised and reparse fails.
	"
	

]

{ #category : #copying }
PP2Reparsable >> postCopy [
	super postCopy.
	
	buffer := buffer copy.
]

{ #category : #accessing }
PP2Reparsable >> reparsable [
	^ self
]

{ #category : #accessing }
PP2Reparsable >> reset [
	buffer := IdentityDictionary new
]
