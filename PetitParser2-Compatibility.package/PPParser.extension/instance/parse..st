*PetitParser2-Compatibility
parse: anObject
	"Parse anObject with the receiving parser and answer the parse-result or an instance of PPFailure."

	^ self parseWithContext: anObject asPetit2Stream asPetit2Context