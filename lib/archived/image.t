[T-]

func img_info(path) {
    past(path) ~> P
    exec(cmd="magick identify " + P) ~> out
}

func img_resize(path, width, height, out_path) {
    past(path) ~> P
    past(width) ~> W
    past(height) ~> H
    past(out_path) ~> O
    toString(val=W) ~> ws
    toString(val=H) ~> hs
    exec(cmd="magick " + P + " -resize " + ws + "x" + hs + " " + O) ~> out
}

func img_convert(path, out_path) {
    past(path) ~> P
    past(out_path) ~> O
    exec(cmd="magick " + P + " " + O) ~> out
}

func img_grayscale(path, out_path) {
    past(path) ~> P
    past(out_path) ~> O
    exec(cmd="magick " + P + " -colorspace Gray " + O) ~> out
}

func img_rotate(path, degrees, out_path) {
    past(path) ~> P
    past(degrees) ~> D
    past(out_path) ~> O
    toString(val=D) ~> ds
    exec(cmd="magick " + P + " -rotate " + ds + " " + O) ~> out
}

func img_crop(path, w, h, x, y, out_path) {
    past(path) ~> P
    past(w) ~> W
    past(h) ~> H
    past(x) ~> X
    past(y) ~> Y
    past(out_path) ~> O
    toString(val=W) ~> ws
    toString(val=H) ~> hs
    toString(val=X) ~> xs
    toString(val=Y) ~> ys
    exec(cmd="magick " + P + " -crop " + ws + "x" + hs + "+" + xs + "+" + ys + " " + O) ~> out
}

func img_text(path, text, out_path) {
    past(path) ~> P
    past(text) ~> T
    past(out_path) ~> O
    shell_escape(str=T) ~> et
    exec(cmd="magick " + P + " -annotate 0 " + et + " " + O) ~> out
}
