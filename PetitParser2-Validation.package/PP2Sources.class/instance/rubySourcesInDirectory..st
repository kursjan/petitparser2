ruby
rubySourcesInDirectory: directory
	| files |
	files := self readDirectory: directory.
	files := self files: files withExtension: 'rb'.
	
	^ files collect: [ :f | [(FileStream fileNamed: f) contents ] on: Error do: [:err | '' ] ]