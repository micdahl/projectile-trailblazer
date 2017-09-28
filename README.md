# Projectile Trailblazer

## Synopsis

**Projectile Trailblazer** is a minor mode for working with [Ruby on Rails](http://rubyonrails.org/) applications and engines supporting
[Trailblazer](http://trailblazer.to/) in [GNU Emacs](https://www.gnu.org/s/emacs/). It uses [Projectile Rails](https://github.com/asok/projectile-rails), which is based on [Projectile](https://github.com/bbatsov/projectile), and adds some Trailblazer specific
commands.

## Setup

### Installation

-   Melpa

    Use `package-install` to install **Projectile Trailblazer**. The package name is `projectile-trailblazer`.

## Usage and customizing

As **Projectile Trailblazer** heavily depends on it, usage and customizing is given at [Projectile Rails](https://github.com/asok/projectile-rails#usage).
To use the package as a global mode use `(projectile-trailblazer-global-mode)`

## Added interactive commands

Additional to the [commands defined by Projectile Rails](https://github.com/asok/projectile-rails#interactive-commands), the following commands are supported:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Command</th>
<th scope="col" class="left">Keybinding</th>
<th scope="col" class="left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">projectile-trailblazer-find-cell</td>
<td class="left"><kbd>C-c ; c</kbd></td>
<td class="left">Find a cell using `projectile-completion-system`</td>
</tr>


<tr>
<td class="left">projectile-trailblazer-find-contract</td>
<td class="left"><kbd>C-c ; t</kbd></td>
<td class="left">Find a contract using `projectile-completion-system`</td>
</tr>


<tr>
<td class="left">projectile-trailblazer-find-operation</td>
<td class="left"><kbd>C-c ; o</kbd></td>
<td class="left">Find an operation using `projectile-completion-system`</td>
</tr>


<tr>
<td class="left">projectile-trailblazer-find-view</td>
<td class="left"><kbd>C-c ; v</kbd></td>
<td class="left">Find an view using `projectile-completion-system`</td>
</tr>
</tbody>
</table>

## Contribution

**Projectile Trailblazer** uses [Cask](https://github.com/cask/cask).

### Local development installation

You can either install it localy and run

    $ cd /path/to/trailblazer-rails
    $ cask

and run

    $ make test

### Use Docker

As an alternative, the repository contains a `Dockerfile` and a `docker-compose.yml`. When you have installed [Docker](https://www.docker.com/)
you prepare with

    $ docker-compose build
    $ docker-compose run app cesk install

After that, you can execute the tests with

    $ docker-compose up

to run the tests.

### Contribute

1.  Fork and checkout
2.  Add test
3.  Run test and be sure it fails
4.  Implement your code
5.  Run test, back to 4. if failing
6.  Create Pull Request
