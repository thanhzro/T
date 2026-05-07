[T-]

func json_get(json, key) {
    past(json) ~> J
    past(key) ~> K
    "\"" + K + "\": \"([^\"]*)\"" >> pat_str
    "\"" + K + "\": ([0-9.]+)" >> pat_num
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
