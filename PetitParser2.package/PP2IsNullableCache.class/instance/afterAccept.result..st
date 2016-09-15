hooks
afterAccept: ctx result: result
	ctx node propertyAt: #isNullable ifAbsentPut: result