python
pythonSourcesBenchmarking
	^ self cachedValue: #pythonSourcesBenchmarking ifAbsentPut: [ 
		self selectEvenly: 100 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]