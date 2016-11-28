I am a parser that can extract an HTML headers from an html file.

Run PP2HtmlHeaderGrammar example

to see, how to extract  the header without downloading the whole file. The example starts a  ZincClient in streaming mode and utilizes PP2 capabilities to work on streams. It reads the stream up until the end of a header or until start of a body.