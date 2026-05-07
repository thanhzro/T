[T-]
import "lib/intermediate/csv.t"
read("examples/hocsinh.csv") ~> P1

[T0]
parse_csv_rows(rows=P1) ~> O1

[T+]
show shall(O1)
