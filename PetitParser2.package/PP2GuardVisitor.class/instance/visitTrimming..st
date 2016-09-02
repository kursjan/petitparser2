visiting
visitTrimming: node
	| trimmerClassification topClassification childClassification |
	trimmerClassification := self classificationFor: node trimmer.
	childClassification := self classificationFor: node child. 

	topClassification := guarded top copy.
	
	1 to: 255 do: [ :index |
		| topC trimC childC |
		topC := topClassification at: index.
		trimC := trimmerClassification at: index.
		childC := childClassification at: index.
		
		"child is not, but top is"
		(childC not and: topC) ifTrue: [  
			"actually, caused by trimmer"
			trimC ifTrue: [ topClassification at: index put: false ]
		]
	].
	"visit the child without the classification caused by trimmer"
	self visit: node child guardedWith: topClassification