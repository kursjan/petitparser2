ruby
rubySourcesBenchmarking
	^ self cachedValue: #rubySourcesBenchmarking ifAbsentPut: [ 
		self selectEvenly: 100 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]