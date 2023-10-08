# dokuwiki-web-vyfukwiki
Repo of Výfuk's wiki

## Instalation
  1. As URL use **localhost** or configure **wiki.local** to redirect to localhost (Windows - `C:\Windows\System32\drivers\etc\hosts`; Linux & MacOS - `/etc/hosts`):
```
127.0.0.1 wiki.local
```
  2. Donwload and install Docker Engine - see docs [here](https://docs.docker.com/engine/install/).  
  *Note: For Windows, you may want to use WSL2 backend for improved performance.*
  3. Clone this repo.
  4. Init all submodules with `git submodule update --init --recursive`
  5. Run docker containers with command `docker-compose up` (while in the root folder of this repo).
  6. Open terminal inside the container with `docker exec -it vyfuk-wiki-php bash`.
  7. Run `composer install` inside folders `lib/plugins/fksdbexport` and `lib/plugins/fksdownloader`.
  8. You should now be able to access the website via URL chosen above.
  9. Get page data & configs from Gimli or contact someone who has access to them.