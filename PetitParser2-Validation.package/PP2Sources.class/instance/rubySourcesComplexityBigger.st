ruby
rubySourcesComplexityBigger
	^ self cachedValue: #rubySourcesComplexityBigger ifAbsent: [ 
		self selectEvenly: 300 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]