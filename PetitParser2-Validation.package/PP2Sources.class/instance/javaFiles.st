java
javaFiles
	^ self files: ((self downloadUI: self javaAllUrl) allFiles) withExtension: 'java'