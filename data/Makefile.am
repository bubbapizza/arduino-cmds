# This is some tricky code for making a tarball of our buildtree 
# so we don't have to go and specify every single file underneath it.

# Zip the contents of the buildtree source into a tarball to go with
# the distribution.
BUILDTREE=buildtree-0022
$(BUILDTREE).tar.gz:
	$(TAR) czvf $(BUILDTREE).tar.gz $(BUILDTREE)

dist_pkgdata_DATA = $(BUILDTREE).tar.gz

# On install of the distribution, unpack the buildtree tarball into
# the data directory.
install-data-hook:
	cd $(DESTDIR)$(pkgdatadir); \
	   $(TAR) zxvf $(BUILDTREE).tar.gz 

# When uninstalling, blow away the buildtree source we extracted above.
uninstall-local:
	cd $(DESTDIR)$(pkgdatadir); \
   rm -Rf $(BUILDTREE)

