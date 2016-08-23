ruby
rubySourcesComplexity
	^ self cachedValue: #rubySourcesComplexity ifAbsent: [ 
		self selectEvenly: 100 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]