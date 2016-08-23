python
pythonSourcesVerification
	^ self cachedValue: #pythonSourcesVerification ifAbsent: [ 
		self selectEvenly: 100 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]