[T-]
"add" >> fname
"plus" >> fop
"mul" >> fname2
"times" >> fop2

[T0]
"func " + fname >> h1
h1 + "(a, b) {" >> header1
"op=" + fop >> body1

"func " + fname2 >> h2
h2 + "(a, b) {" >> header2
"op=" + fop2 >> body2

[T+]
show shall(header1, body1, header2, body2)
