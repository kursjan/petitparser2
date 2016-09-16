java
javaSourcesBenchmarking
	^ self cachedValue: #javaSourcesBenchmarking ifAbsentPut: [ 
		self 
			selectEvenly: 100
			from: 	(self javaSourcesInDirectory: self javaAllDirectory)
			thatSatisfy: self javaWorkingBlock
 	]
