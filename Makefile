all: genhtml

USER = shlomif
REMOTE = $(USER)@web.sourceforge.net:/home/project-web/pysolfc/htdocs/

HTML_PIVOT = htdocs/index.html

genhtml: $(HTML_PIVOT)

INPUTS = $(patsubst %,templates/%,all_games.html index.html screenshots.html _header.jinja)

$(HTML_PIVOT): $(INPUTS)
	staticjinja build --outpath htdocs/

# download:
#	rsync -a -v --progress $(REMOTE) ./htdocs

upload:
	rsync -a -v --progress ./htdocs/ $(REMOTE)
