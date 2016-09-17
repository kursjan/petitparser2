java
javaWorkingBlock
	^ [ :fileReference | 
		[ (PPJavaSyntax parse: fileReference contents) isPetit2Failure not ] 
			valueWithin: 10 asDuration 
			onTimeout: [ false ] 
	]