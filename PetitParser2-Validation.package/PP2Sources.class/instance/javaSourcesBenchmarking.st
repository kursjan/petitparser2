java
javaSourcesBenchmarking
	^ self cachedValue: #javaSourcesBenchmarking ifAbsentPut: [ 
		self 
			selectEvenly: 100
			fromFiles: 	self javaFiles
			thatSatisfy: self javaWorkingBlock
 	]
