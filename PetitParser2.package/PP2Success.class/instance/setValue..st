modifications
setValue: value
	"answers a copy of the context that has an updated return value"
	^ self copy
		retval: value