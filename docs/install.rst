Installation
=============
The CodeGrade filesystem has to be installed and both the ``cgfs`` and the
``cgapi-consumer`` helper program must be available from the user's ``$PATH``
to successfully install and use the Vim editor plugin. This should be
automatically done when installing the CodeGrade Filesystem with the official
installer.

Vim 8 and up
-------------

Installing the CodeGrade Vim plugin for Vim v8 or higher is done by creating a
CodeGrade bundle directory in your ``.vim`` folder, for instance:
``mkdir ~/.vim/pack/CodeGrade/start``. And then finally cloning the plugin
repository inside this folder via this command:
``git clone https://github.com/CodeGra-de/CodeGra.vim ~/.vim/pack/CodeGrade/start/CodeGra.vim``


Up to Vim 8
------------
Installing the CodeGrade Vim plugin for Vim versions up to 8 is done using your
package manager of choice. Some examples for popular package managers


.. code-block:: vim

    " vim-plug
    call plug#begin()
    Plug 'CodeGra-de/CodeGra.vim'
    call plug#end()

    " Vundle
    call vundle#begin()
    Plugin 'CodeGra-de/CodeGra.vim'
    call vundle#end()
    filetype plugin on

    " minpac
    call minpac#init()
    call minpac#add('CodeGra-de/CodeGra.vim')
