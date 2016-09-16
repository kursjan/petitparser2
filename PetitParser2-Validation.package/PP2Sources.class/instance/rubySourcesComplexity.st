ruby
rubySourcesComplexity
	^ self cachedValue: #rubySourcesComplexity ifAbsentPut: [ 
		self selectEvenly: 100 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]