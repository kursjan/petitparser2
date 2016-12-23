actions
export: class
	| name |
	name := class name.
	
	(('build/', name, '.st') asFileReference) deleteIfAbsent: nil.
	class fileOut.
	(name, '.st') asFileReference moveTo: (('build/', name, '.st') asFileReference).