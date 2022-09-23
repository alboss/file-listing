# file-listing
Use JS to provide an ftp-like UI when directory browsing is enabled

For now, it depends on query strings in the URL to know what to do.
Required:
* where (full URL of the directory you want to browse. Needs to end with a /.)
* dir (just the name of the directory you want to browse.)
* toplevel (the uppermost directory you want people to be able to look at)

Example: http://localhost:3333/js2.html?where=http://localhost:3333/docs&dir=docs&toplevel=docs
