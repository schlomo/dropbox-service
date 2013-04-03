dropbox-service
===============

DEB package to run dropbox client as a system service

Roughly follows the ideas from http://www.dropboxwiki.com/Text_Based_Linux_Install

Upon installation of the package the dropbox binaries will be downloaded and the service started. If the system is not linked to a dropbox account, it will present a linkup URL and wait for the linkup.

After that the service is started. The postinst script waits for the DropBox content to be synchronized.
