accessing
scripts: rootElement
	^ rootElement allNodes select: [ :e | e isKindOf: JavascriptElement  ]