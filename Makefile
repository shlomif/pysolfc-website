all:

USER = shlomif
REMOTE = $(USER)@web.sourceforge.net:/home/project-web/pysolfc/htdocs/

# download:
#	rsync -a -v --progress $(REMOTE) ./htdocs

upload:
	rsync -a -v --progress ./htdocs/ $(REMOTE)
