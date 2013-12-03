DPKG=dpkg
DPKG_OPTS=-b
.PHONY: info repo deb

info: deb
	dpkg-deb -I out/*_all.deb
	dpkg-deb -c out/*_all.deb

deb:	clean
	rm -Rf build
	mkdir -p out
	cp -r src build
	cp -r DEBIAN build
	mkdir -p build/usr/share/doc/dropbox-service
	mv build/DEBIAN/copyright build/usr/share/doc/dropbox-service/copyright
	git log | gzip -9 >build/usr/share/doc/dropbox-service/changelog.gz
	chmod -R g-w build
	fakeroot ${DPKG} ${DPKG_OPTS} build out
	rm -Rf build
	lintian -i out/*_all.deb
	cp out/*_all.deb out/dropbox-service-latest.deb
	git add -A

repo: deb
	../putinrepo.sh out/*_all.deb

clean:
	rm -fr out build


