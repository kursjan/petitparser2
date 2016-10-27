accessing
withoutDuplicates: set
	| newSet |
	newSet := Set new.
	newSet addAll: set.
	^ newSet