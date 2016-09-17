*PetitParser2-Smalltalk
smalltalkSourcesAll
	^ self cachedValue: #smalltalkSourcesAll ifAbsentPut: [ 
		(self downloadUI: self smalltalkAllUrl) allFiles collect: [ :f | f contents ]
	]