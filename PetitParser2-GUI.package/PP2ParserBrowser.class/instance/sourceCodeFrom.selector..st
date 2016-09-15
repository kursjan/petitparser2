private utilities
sourceCodeFrom: class selector: production
	^ class ultimateSourceCodeAt: (production ifNil: [ #start ]) ifAbsent: [ String new ]