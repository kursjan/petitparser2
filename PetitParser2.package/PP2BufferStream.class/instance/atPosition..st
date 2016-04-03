context interface
atPosition: readPosition
	(readPosition + 1 == position) ifTrue: [ 
		^ self last.
	].

	(readPosition >= position) ifTrue: [ 
		self upToPosition: readPosition + 1.
		^ self last
	].

	"backtrack case"
	(position - readPosition > bufferSize) ifTrue: [ 
		SubscriptOutOfBounds signalFor: readPosition.
	].
	^ buffer at: (readPosition % bufferSize) + 1.

