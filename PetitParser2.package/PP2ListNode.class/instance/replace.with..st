transforming
replace: child with: anotherChild
	children keysAndValuesDo: [ :index :e |
		e == child ifTrue: [ children at: index put: anotherChild ] 
	]