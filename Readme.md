# Guard-Ragel

guard-ragel compiles your .rl files automatically when changed.

## Install

Guard-Ragel requires the [guard](https://github.com/mxcl/homebrew) rubygem as
well as [Ragel](http://www.complang.org/ragel/). If you're using
[homebrew](https://github.com/mxcl/homebrew) you can install ragel easily with:

    brew install ragel

To install guard-ragel you can:

    gem install guard-ragel

Or add it to your bundler Gemfile:

    gem 'guard-ragel'

To get a sample entry in your Guardfile:

    guard init ragel

## Usage

```ruby
guard 'ragel' do
  watch(%r{^ragel/.+\.rl})
end
```

Defaults to writing to the same directory in the ruby output format.

An input file of ragel.rl will output a file of ragel.rb in the same directory.


## Options

```ruby
:output_format => :ruby             # The output format to generate, this defaults to :ruby but supports one of:
                                    #
                                    # :c         The host language is C, C++, Obj-C or Obj-C++
                                    # :d         The host language is D
                                    # :go        The host language is Go
                                    # :java      The host language is Java
                                    # :ruby      The host language is Ruby
                                    # :csharp    The host language is C#
                                    # :ocaml     The host language is OCaml
                                    #
:options => ''                      # Any additional command line arguments to send to ragel
:output => nil                      # Optional output directory to place output files in, if
                                    # nil will put output files in the same directory as the source file
:notification => false              # Whether to display notifications after finished,
                                    #  default: true
:extension => nil                   # Override output file extension
```
