[T-]
json = "{\"name\": \"Thanh\", \"score\": 95}"

[T0]
json_set(json=json, key="score", val=100) ~> O1

[T+]
show shall(O1)
