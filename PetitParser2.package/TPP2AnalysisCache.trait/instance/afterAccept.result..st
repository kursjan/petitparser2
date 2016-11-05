hooks
afterAccept: ctx result: result
	ctx node propertyAt: self propertySymbol ifAbsentPut: result