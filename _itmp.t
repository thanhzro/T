[T-]
[T0]
tcon_query(query="Gate undefined variable returns wrong") ~> r1
tcon_query(query="native missing func not found") ~> r2
tcon_query(query="array in func body loses type") ~> r3
[T+]
show shall(r1, r2, r3)
