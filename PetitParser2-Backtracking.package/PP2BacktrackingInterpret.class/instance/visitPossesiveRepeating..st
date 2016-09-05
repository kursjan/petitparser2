visiting
visitPossesiveRepeating: parser
	| retval elements index |

	"
		JK: Use index to allow for continuations. When the context is restored from the continuation,
		the collection is not restored. We can either use immutable collections (but we do not) or
		we can keept track of index and manage the collection elements on our own.
	"
	
	index := 0.
	elements := OrderedCollection new.
	
	[ index < parser min ] whileTrue: [
	 	(retval := self visit: parser child) isPetit2Failure 
			ifTrue: [ ^ retval ].
		index := index + 1.
		elements at: index ifAbsentPut: retval.
	].

	[ index < parser max ] whileTrue: [
	 	(retval := self visit: parser child) isPetit2Failure 
			ifTrue: [ ^ (elements copyFrom: 1 to: index) ].
		index := index + 1.
		elements at: index ifAbsentPut: retval.
	].

	^ elements
