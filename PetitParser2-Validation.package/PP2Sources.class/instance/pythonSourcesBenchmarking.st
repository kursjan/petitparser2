python
pythonSourcesBenchmarking
	^ self cachedValue: #pythonSourcesBenchmarking ifAbsent: [ 
		self selectEvenly: 100 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]