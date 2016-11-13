testing
isMemoized
	^ self strategies anySatisfy: [ :s | s isMemoized ]