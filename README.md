# Mirroring

## Summary

A lightweight bash script that allows easy mirroring of projects to external git hosts.

## Getting started

Simply fork this repository, as it has all the scripts necessary for performing mirrors. You can then add your repositories into the `assets/` directory. You will want to store them as such:

```
> repoA/
    > bitbucket.config
    > github.config
    > gitlab.config
    > someService.config
    > REPO
> repoB/
    > ...
> repoC/
    > ...
```

Each repositroy is its own directory. The `REPO` file is expected, and will contain only one variable, `SOURCE`. The source variable is used for retrieving the repository from the original source location. For each site, you can then create a `<site>.config` file that contains the following variables:

|Name|Description|
|***|***|
|MIRROR_NAME|The name of the host site|
|MIRROR_SSH|The ssh url of the git repository.|
|MIRROR_HTTP|The http url of the git repository.|

You can see an example `github.config` file presented below:

```bash
MIRROR_NAME="github"
MIRROR_SSH="git@github.com:jrbeverly/XPlatformer.git"
MIRROR_HTTP="https://github.com/jrbeverly/XPlatformer.git"
```