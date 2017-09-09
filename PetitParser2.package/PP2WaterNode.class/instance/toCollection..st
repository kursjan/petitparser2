private
toCollection: object
	object isCollection ifTrue: [ ^ object ].
	
	^ object asOrderedCollection