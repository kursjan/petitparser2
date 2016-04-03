context interface
copyFrom: start to: end
	"start - end should be in range <0, collection size) "
	^ collection copyFrom: start + 1 to: end + 1