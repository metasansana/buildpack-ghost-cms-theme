# Ghost CMS Theme Buildpack

This is a custom buildpack for building [Ghost CMS](https://ghostcms.org) on
[dokku](https://dokku.viewdocs.io).

## About Buildpacks

Information about using custom buildpacks with dokku can on the dokku site.
Long story short: Include a `.buildpacks` file in your repo where each
line is a git clonable URL to a buildpack you want to use.

Example:
```sh
https://github.com/heroku/heroku-nodejs-buildpack.git#v123
https://github.com/metasansana/buildpack-ghost-cms-theme
```
## About This Buildpack

This buildpack will build a Ghost CMS blog given a repo that is a ghost-theme.
It use the `ghost-cli` tool without all the environment checking stuff to
make deployment easier on platforms like dokku.

This buildpack depends on and MUST be used with the official Node.js buildpack
as shown in the example above.

## Usage

### Before You Push

In order to successfully build your app from a `git push` your app MUST
be a valid Ghost CMS theme. During the build process the buildpack creates a
`www-ghost` folder that it will install the desired Ghost CMS release to.

You therefore should not have any files or directories named `www-ghost` in your
project.

### Dokku

Before pushing your app, you need to specify a few environment variables
otherwise builds will fail. Note that this buildpack currently only supports
the MySQL installation.

#### Environment Variables

DB_HOST - The host address of the MySQL installation (required).
DB_PORT - The port to connect to MySQL with.
DB_NAME - The name of the database to use (required).
DB_USER - The username of the database user (required).
DB_PASS - The password of the database user (required).
URL     - The url Ghost will use in your blog (required).

After configuring your environment variables, push your app and it should
build. Give Ghost some time to complete the installation if this is the first
push.

## License

Apache-2.0 plus vendored packages. See the LICENSE file for more info.

