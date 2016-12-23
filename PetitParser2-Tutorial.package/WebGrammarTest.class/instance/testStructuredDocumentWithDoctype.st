tests
testStructuredDocumentWithDoctype
	| input |
	input := '
<!DOCTYPE html>
<!-- comment -->
<html>
	<body>
		<script>alert("hello world")</script>
	</body>
</html>'.
	
	self parse: input rule: #structuredDocument