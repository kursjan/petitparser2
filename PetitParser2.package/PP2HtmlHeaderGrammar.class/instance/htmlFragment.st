rules
htmlFragment
	^ (#any asPParser starLazy: (headerStart / bodyStart)), header ==> #second