Extension { #name : #Object }

{ #category : #'*PetitParser2' }
Object >> asArray [
	^ Array with: self
]

{ #category : #'*PetitParser2' }
Object >> asMapArgument [
	"JK: Hack alert. OrderedCollection is returned from the repeating parsers.
		Array is returned from the sequence parser.
		
		As an argument into the mapping parser, ordered collection is transformed into an array
		with that collection. Array is passed unmodified.
	"
	^ Array with: self
]

{ #category : #'*PetitParser2' }
Object >> isPetit2Failure [
	^ false
]

{ #category : #'*PetitParser2' }
Object >> isPetit2Parser [
	^ false
]

{ #category : #'*PetitParser2' }
Object >> isPetit2Success [
	^ true
]

{ #category : #'*PetitParser2' }
Object >> isToken [
	^ false
]

{ #category : #'*PetitParser2-Reparsing' }
Object >> nodesDo: aBlock [
	"JK: this is kind of hack, I don't like having this method here"
	"nothing to do"
]
