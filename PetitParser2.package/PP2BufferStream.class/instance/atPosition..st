context interface
atPosition: readPosition
	(readPosition == position) ifTrue: [ 
		^ self last.
	].

	(readPosition > position) ifTrue: [ 
		self upToPosition: readPosition.
		(readPosition > position) ifTrue: [ SubscriptOutOfBounds signal ].
		^ self last
	].

	"backtrack case"
	(position - readPosition >= bufferSize) ifTrue: [ 
		SubscriptOutOfBounds signalFor: readPosition.
	].
	^ buffer at: ((readPosition - 1) % bufferSize) + 1.

