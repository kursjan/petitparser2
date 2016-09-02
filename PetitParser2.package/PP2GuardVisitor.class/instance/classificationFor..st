support
classificationFor: node
	| classification charSet firstSet |
	classification := Array new: 255 withAll: false.

	firstSet := node firstSet.
	firstSet do: [ :first |  
		charSet := first firstCharSet.
		
		charSet isUnknown ifTrue: [ ^ anythingClassification  ].
		
		charSet classification withIndexDo: [ :value :index |  
			value ifTrue: [ classification at: index put: true ]
		]
	].

	^ classification