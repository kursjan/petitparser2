comparing
equals: anotherNode visitedSet: visitedSet
	self == anotherNode ifTrue: [ ^ true ].
	
	"
		Manages visited set in order to avoid inifinite loops, I don't see much reasons to
		override this method.
	"
	(visitedSet includes: self) ifTrue: [ ^ true ].
	(visitedSet add: self).

	(self localEquals: anotherNode) ifFalse: [ ^ false ].	
	(self childrenEqual: anotherNode visitedSet: visitedSet) ifFalse: [ ^ false ].
	
	^ true