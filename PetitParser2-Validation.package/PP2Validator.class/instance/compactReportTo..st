reporting
compactReportTo: filename
	| file |
	file := FileStream forceNewFileNamed: filename.
	self report printCompactOnStream: file.
	file close.