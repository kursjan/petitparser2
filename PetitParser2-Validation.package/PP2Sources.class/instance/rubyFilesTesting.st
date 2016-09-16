ruby
rubyFilesTesting
	^ self cachedValue: #rubyFilesTesting ifAbsentPut: [ 
		self selectEvenly: 50 from: self rubyFilesAll
	]