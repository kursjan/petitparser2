hooks
afterAccept: ctx result: result
	ctx node propertyAt: #firstProductionSet ifAbsentPut: result