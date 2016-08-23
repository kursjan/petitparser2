ruby
rubySourcesBenchmarking
	^ self cachedValue: #rubySourcesBenchmarking ifAbsent: [ 
		self selectEvenly: 100 from: (self rubySourcesInDirectory: self rubyAllDirectory)
	]