transforming
transform
	(class definesInstanceVariable: method selector asString)
		ifFalse: [ class addInstanceVariable: method selector asString ].
	class compile: method newSource classified: protocols