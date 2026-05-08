[T-]

func db_query(db, sql) {
    past(db) ~> D
    past(sql) ~> S
    "sqlite3 " + D + " \"" + S + "\"" >> cmd
    exec(cmd=cmd) ~> out
}

func db_exec(db, sql) {
    past(db) ~> D
    past(sql) ~> S
    "sqlite3 " + D + " \"" + S + "\"" >> cmd
    exec(cmd=cmd) ~> out
}

func db_create_table(db, table, cols) {
    past(db) ~> D
    past(table) ~> TB
    past(cols) ~> C
    "CREATE TABLE IF NOT EXISTS " + TB + " (" + C + ")" >> sql
    db_exec(db=D, sql=sql) ~> out
}

func db_insert(db, table, vals) {
    past(db) ~> D
    past(table) ~> TB
    past(vals) ~> V
    "INSERT INTO " + TB + " VALUES (" + V + ")" >> sql
    db_exec(db=D, sql=sql) ~> out
}

func db_select(db, table) {
    past(db) ~> D
    past(table) ~> TB
    "SELECT * FROM " + TB >> sql
    db_query(db=D, sql=sql) ~> raw
    split(str=raw, sep="\n") ~> out
}

func db_where(db, table, cond) {
    past(db) ~> D
    past(table) ~> TB
    past(cond) ~> C
    "SELECT * FROM " + TB + " WHERE " + C >> sql
    db_query(db=D, sql=sql) ~> raw
    split(str=raw, sep="\n") ~> out
}

func db_delete(db) {
    past(db) ~> D
    "rm -f " + D >> cmd
    exec(cmd=cmd) ~> out
}
