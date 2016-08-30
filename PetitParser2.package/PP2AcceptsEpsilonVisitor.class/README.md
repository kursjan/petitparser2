I return true, if parser ALWAYS accepts epsilon without a failure.
		
Use #isNullable if it can accept epsilon, but it can fail as well.

- I do not chache the result
- I do allow to everride the behaviour by setting the #acceptsEpsilon property