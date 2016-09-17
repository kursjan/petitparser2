accessing
startMethod
	"Make sure the method node has the source code properly set."
	^ ([ :context | context upToEnd ] asPParser and, super startMethod)
		map: [ :source :node | node source: source ]