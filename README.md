# Personal portfolio

This repository contains the source code of my personal portfolio [jesusgomez.io](http://jesusgomez.io).

It uses:

-   Makefile magic to simplify recurrent tasks
-   Docker self-contained image as deployment artifact
-   [Docker automated builds](https://docs.docker.com/docker-hub/builds/) to automate the builds of the Docker images
-   [Docker override build and push commands](https://docs.docker.com/docker-hub/builds/advanced/#override-build-test-or-push-commands) to get approach of Docker multi-stages under Docker Hub automated builds platform
-   [GitHub API](https://developer.github.com/v3/)
-   [GitHub Gists API](https://developer.github.com/v3/gists/)
-   JavaScript tricks to [obfuscate email address](https://github.com/jesugmz/portfolio/blob/master/src/index.html#L192) against spammers


## TODO

-   Add StackOverflow API
-   Compress HTML code in production stage
-   Add application tests
-   Add system health-checks
