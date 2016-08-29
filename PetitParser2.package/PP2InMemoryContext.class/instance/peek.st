accessing
peek
	"An improved version of peek, that is slightly faster than the built in version."

	^ self atEnd ifFalse: [ collection at: position + 1 ]