java
javaSourcesProfiling
	^ self cachedValue: #javaSourcesProfiling ifAbsentPut: [ 
		self 
			selectEvenly: 10
			fromFiles: self javaFiles
			thatSatisfy: self javaWorkingBlock
 	]
