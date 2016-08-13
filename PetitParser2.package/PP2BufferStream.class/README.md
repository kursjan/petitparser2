Suppose very minimal stream with the following interface:
- atEnd
- next

I can adapt this stream and simulate the positionable stream thanks to the buffer.

Some functionality is nevertheless limited, e.g. the contents cannot be returned unless the whole stream is readed. 

I also index everything from 0 and not from 1. The reason being the modulo arithmetics that works better when indexed from 0.