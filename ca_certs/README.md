This is not the only place ca_certs are stored.

Some guides have suggested the convention of putting ca certs in a ~/ca_certs directory, so I am doing that here.

But I also have certs in /usr/local/share/ca-certificates and in /etc/ssl/certs.

Perhaps I should use symlinks, because now I am putting the same cert files in two or three places.
