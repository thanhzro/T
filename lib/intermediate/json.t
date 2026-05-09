[T-]

func json_get(json, key) {
    past(json) ~> J
    past(key) ~> K
    "\"" + K + "\":\"([^\"]*)\"" >> pat_str
    "\"" + K + "\":([0-9.]+)" >> pat_num
    regex_find(str=J, pat=pat_str) ~> str_val
    regex_find(str=J, pat=pat_num) ~> num_val
    regex_match(str=num_val, pat="^[0-9.]+$") ~> is_num
    [] >> opts
    push(arr=opts, val=str_val) ~> opts
    push(arr=opts, val=num_val) ~> opts
    get(arr=opts, idx=is_num) ~> out
}



func json_array(json, key) {
    past(json) ~> J
    past(key) ~> K
    "\"" + K + "\": [" >> marker
    indexOf(str=J, sub=marker) ~> start
    len(val=marker) ~> mlen
    start + mlen >> arr_start
    indexOf(str=J, sub="]") ~> arr_end
    slice(str=J, from=arr_start, to=arr_end) ~> raw
    replace(str=raw, old="\"", new="") ~> clean
    replace(str=clean, old=" ", new="") ~> clean2
    split(str=clean2, sep=",") ~> out
}

func json_keys(json) {
    past(json) ~> J
    regex_find(str=J, pat="\{(.*)\}") ~> inner
    split(str=inner, sep=",") ~> pairs
    F(pairs) {
        split(str=now, sep=":") ~> parts
        get(arr=parts, idx=0) ~> key
        trim(str=key) ~> key
        replace(str=key, old="\"", new="") ~> now
    }
    pairs >> out
}

func json_set_key(json, key, val) {
    past(json) ~> J
    past(key) ~> K
    past(val) ~> V
    json_set(json=J, key=K, val=V) ~> out
}

func json_has(json, key) {
    past(json) ~> J
    past(key) ~> K
    indexOf(str=J, sub=K) ~> idx
    Gate idx (>= 0) >> O1
    isNumber(val=O1) ~> out
}

func json_str(key, val) {
    past(key) ~> K
    past(val) ~> V
    "{\"" + K + "\": \"" + V + "\"}" >> out
}

func json_num(key, val) {
    past(key) ~> K
    past(val) ~> V
    toString(val=V) ~> vs
    "{\"" + K + "\":" + vs + "}" >> out
}

func json_arr(key, arr) {
    past(key) ~> K
    past(arr) ~> A
    join(arr=A, sep=", ") ~> items
    "{\"" + K + "\":[" + items + "]}" >> out
}
