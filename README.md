# dokuwiki-web-vyfukwiki
Repo of Výfuk's wiki

## Instalation
  1. Use **localhost** or configure **wiki.local** to redirect to localhost (Windows - `C:\Windows\System32\drivers\etc\hosts`; Linux & MacOS - `/etc/hosts`):
```
127.0.0.1 wiki.local
```
  2. Donwload and install Docker Engine - see docs [here](https://docs.docker.com/engine/install/).  
  *Note: For Windows, you may want to use WSL2 backend for improved performance.*
  3. Clone this repo.
  4. On Linux, change file owner to apache user & group (`chown -R <yourusername>:33 .`, replace <yourusername> with your username) & change permissions to 775 (`chmod -R 775 .`).
     Also, if you haven't done this already, add your user to the http/apache group (depends on your distribution).
  5. Init all submodules with `git submodule update --init --recursive`
  6. Run docker containers with command `docker-compose up` (while in the root folder of this repo).
  7. You should now be able to access the website via url 'http://wiki.local'.