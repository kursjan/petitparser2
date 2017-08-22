accessing
source
	^ self completeSource
		ifNotNil:
			[ :value | (value copyFrom: self startPosition to: self stopPosition) asString ]