Extension { #name : #PP2Sources }

{ #category : #'*PetitParser2-Smalltalk' }
PP2Sources >> smalltalkAllUrl [
	^ 'smalltalk-src-selected.zip'
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Sources >> smalltalkFiles [
	^ self files: ((self downloadUI: self smalltalkAllUrl) allFiles) withExtension: 'st'
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Sources >> smalltalkSourcesAll [
	^ self cachedValue: #smalltalkSourcesAll ifAbsentPut: [ 
		(self downloadUI: self smalltalkAllUrl) allFiles collect: [ :f | f contents ]
	]
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Sources >> smalltalkSourcesBenchmarking [
	^ self cachedValue: #smalltalkSourcesBenchmarking ifAbsentPut: [ 
		"self smalltalkSourcesInDirectory: self smalltalkSelectedDirectory."
		self 
			selectEvenly: 10000 
			fromFiles: 	self smalltalkFiles
		]
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Sources >> smalltalkSourcesProfiling [
	^ self cachedValue: #smalltalkSourcesProfiling ifAbsentPut: [ 
		self 
			selectEvenly: 1000 
			fromFiles: 	self smalltalkFiles
	]
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Sources >> smalltalkSourcesVerification [
	^ self cachedValue: #smalltalkSourcesVerification ifAbsentPut: [ 
		"self smalltalkSourcesInDirectory: self smalltalkSelectedDirectory."
		self 
			selectEvenly: 5*1000 
			fromFiles: self smalltalkFiles
	]
]
