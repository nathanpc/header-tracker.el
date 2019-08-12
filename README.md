# header-tracker.el

Quickly and easily keep track and switch between header and source files.

## Usage

This package exports a interactive function `header-tracker-toggle-header` which can be binded to a key to seamlessly switch between source and header files. This can be accomplished by adding the following lines to your `init.el`:

    (add-hook 'c-mode-common-hook
               (lambda ()
                 (local-set-key (kbd "C-c h") 'header-tracker-toggle-header)))

## Supported Files

Currently the package supports the following project structures/filenames:

  - .../src/.../name.h
  - .../include/.../name.h
  - .../src/.../name.c
  - .../src/.../name.cpp

This is also the priority order the switching function uses to determine which file to switch to.

## License

> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation, either version 3 of the License, or
> (at your option) any later version.
> 
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
> 
> You should have received a copy of the GNU General Public License
> along with this program.  If not, see <http://www.gnu.org/licenses/>.
