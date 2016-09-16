ruby
rubySourcesComplexityBigger
	^ self cachedValue: #rubySourcesComplexityBigger ifAbsentPut: [ 
		self selectEvenly: 300 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]