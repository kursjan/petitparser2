python
pythonSourcesProfiling
	^ self cachedValue: #pythonSourcesProfiling ifAbsentPut: [ 
		self selectEvenly: 5 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]