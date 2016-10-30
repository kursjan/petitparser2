accessing
scripts: rootElement
	^ rootElement allElements select: [ :e | e isKindOf: JavascriptElement  ]