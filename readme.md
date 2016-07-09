# [ Sobriquet ]( https://github.com/denislaliberte/sobriquet )
author : denis.laliberte@gmail.com

## Description

sobiquet is a command line tool that help you to save quickly new shell alias
variables.

## Usage

Add an alias

    $ sobrique add gs 'git status'
    $ sobriquet generate
    $ source ~/.sobriquet.sh
    $ gs
    ## master
     M readme.md

## Install

     gem install sobriquet

## Change log

### v1.0
#### added
- Initialise csv file
- Add an alias to the csv file
- Generate a shell file with alias from the csv file
- add a variable

## Roadmap

### version 1.1-planned
#### planned
- test bad csv file in persistance::get
- generate reamde-rdoc from the reamde markdown
- refactor to use abstraction for file operation
- check if alias is overriding an other alias
- search
- check for duplicated alias/variables before adding

### version 1.2-planned
#### planned
- search by tag or binairies
- Interactive ask for description, examples and tags

### version 1.3-planned
#### planned
- search and import alias from csv file on the network (github)

## later
- local sobriquet to a folder for alias an variable specific to a project
- generate md and html to document alias

## MIT License

Copyright (c) 2016 Denis Laliberté

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
