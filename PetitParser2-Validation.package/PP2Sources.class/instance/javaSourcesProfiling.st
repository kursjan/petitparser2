java
javaSourcesProfiling
	^ self cachedValue: #javaSourcesProfiling ifAbsentPut: [ 
		self 
			selectEvenly: 10
			from: 	(self javaSourcesInDirectory: self javaAllDirectory)
			thatSatisfy: self javaWorkingBlock
 	]
