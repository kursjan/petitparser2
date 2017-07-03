Parser that can extract an HTML headers from an html file without downloading the whole file. Try with:

PP2HtmlHeaderGrammar example

The example starts a  ZincClient in streaming mode and utilizes PP2 capabilities to work on streams. It reads the stream up until the end of a header or until start of a body.