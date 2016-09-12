java
javaSourcesProfiling
	^ self cachedValue: #javaSourcesProfiling ifAbsent: [ 
		self 
			selectEvenly: 10
			from: 	(self javaSourcesInDirectory: self javaAllDirectory)
			thatSatisfy: self javaWorkingBlock
 	]
