ruby
rubyFilesInDirectory: directory
	| files |
	files := self readDirectory: directory.
	^ self files: files withExtension: 'rb'.
	
