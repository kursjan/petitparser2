ruby
rubySourcesProfiling
	^ self cachedValue: #rubySourcesProfiling ifAbsentPut: [ 
		self selectEvenly: 5 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]