python
pythonSourcesVerification
	^ self cachedValue: #pythonSourcesVerification ifAbsentPut: [ 
		self selectEvenly: 100 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]