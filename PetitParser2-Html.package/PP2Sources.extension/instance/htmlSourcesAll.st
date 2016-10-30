*PetitParser2-Html
htmlSourcesAll
	^ self cachedValue: #htmlSourcesAll ifAbsentPut: [ 
		(self downloadUI: self htmlAllUrl) allFiles collect: [ :f | f contents ]
	]