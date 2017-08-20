parsing
parseOn: context
	| start retval |
	start := context position.
	(retval := self pattern parseOn: context) isPetit2Failure
		ifTrue: [ ^ retval ].
	(name notNil and: [ retval fourth notNil ]) ifTrue: [ 
		(retval fourth second = name)
				ifFalse: [ context restorePosition: start.
					^ PP2Failure message: 'name do not match' context: context ] ].
			
	^ context newToken: PP2PatternToken from: start