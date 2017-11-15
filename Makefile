all:

download:
	rsync -a -v --progress shlomif@web.sourceforge.net:/home/project-web/pysolfc/htdocs/ ./htdocs
