pillar-support
sourceFor: selector in: class
	^ class name, '>>', (class methodNamed: selector) sourceCode