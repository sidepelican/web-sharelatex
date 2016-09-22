version = {
	"ace": "1.2.5"
	"pdfjs": "1.3.91p1"
}

module.exports = {
	version: version

	lib: (name) ->
		if version[name]?
			return "#{name}-#{version[name]}"
		else
			return "#{name}"
}
