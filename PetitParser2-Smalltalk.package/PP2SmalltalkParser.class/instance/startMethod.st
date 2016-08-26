accessing
startMethod
	"Make sure the method node has the source code properly set."
	^ ([ :context | context upToEnd ] asParser2 and, super startMethod)
		map: [ :source :node | node source: source ]