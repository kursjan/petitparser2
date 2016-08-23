ruby
rubySourcesProfiling
	^ self cachedValue: #rubySourcesProfiling ifAbsent: [ 
		self selectEvenly: 5 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]