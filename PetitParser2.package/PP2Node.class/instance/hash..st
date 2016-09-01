comparing
hash: visitedSet
	"
		Manages visited set in order to avoid inifinite loops, I don't see much reasons to
		override this method.
	"
	(visitedSet includes: self) ifTrue: [ ^ '' hash ].
	(visitedSet add: self).

	^ self localHash bitXor: (self childrenHash: visitedSet)