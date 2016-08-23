ruby
rubyFilesTesting
	^ self cachedValue: #rubyFilesTesting ifAbsent: [ 
		self selectEvenly: 50 from: self rubyFilesAll
	]