initialization
initializeForSize: size
	"nothing to do"
	bufferSize := size.
	buffer := ByteString new: bufferSize.
	position := 0.