python
pythonSourcesProfiling
	^ self cachedValue: #pythonSourcesProfiling ifAbsent: [ 
		self selectEvenly: 5 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]