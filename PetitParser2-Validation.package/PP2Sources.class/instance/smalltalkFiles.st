smalltalk
smalltalkFiles
	^ self files: ((self downloadUI: self smalltalkAllUrl) allFiles) withExtension: 'st'