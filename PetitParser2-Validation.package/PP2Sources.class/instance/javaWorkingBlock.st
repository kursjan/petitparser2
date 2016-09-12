java
javaWorkingBlock
	^ [ :source | 
		[ (PPJavaSyntax parse: source) isPetit2Failure not ] 
			valueWithin: 10 asDuration 
			onTimeout: [ false ] 
	]