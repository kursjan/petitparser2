java
javaSourcesBenchmarking
	^ self cachedValue: #javaSourcesBenchmarking ifAbsent: [ 
		self 
			selectEvenly: 100
			from: 	(self javaSourcesInDirectory: self javaAllDirectory)
			thatSatisfy: self javaWorkingBlock
 	]
