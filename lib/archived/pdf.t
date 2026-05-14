[T-]

func pdf_to_text(path) {
    past(path) ~> P
    exec(cmd="pdftotext " + P + " -") ~> out
}

func pdf_pages(path) {
    past(path) ~> P
    exec(cmd="pdfinfo " + P + " | grep Pages | awk '{print $2}'") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func pdf_to_text_page(path, page) {
    past(path) ~> P
    past(page) ~> PG
    toString(val=PG) ~> pgs
    exec(cmd="pdftotext -f " + pgs + " -l " + pgs + " " + P + " -") ~> out
}

func pdf_info(path) {
    past(path) ~> P
    exec(cmd="pdfinfo " + P) ~> out
}

func pdf_images(path, out_dir) {
    past(path) ~> P
    past(out_dir) ~> O
    exec(cmd="pdfimages " + P + " " + O + "/img") ~> out
}
