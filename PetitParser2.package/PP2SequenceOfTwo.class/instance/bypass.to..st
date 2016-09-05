transformation
bypass: child to: target
	firstChild == child ifTrue: [ firstChild := target ].
	secondChild == child ifTrue: [ secondChild := target ]