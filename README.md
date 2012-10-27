# Payoneer::Csv

Simple tool for converting payoneer pdf report to csv file.

[![Build status](https://secure.travis-ci.org/lucassus/payoneer_csv.png)](http://travis-ci.org/lucassus/payoneer_csv)

## Installation

First of all install `pdftotext` executable

    $ sudo apt-get install poppler-utils

Add this line to your application's Gemfile:

    gem 'payoneer_csv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payoneer_csv

## Usage

`payoneer_csv [path to pdf report]`

Example:


```
$ payoneer_csv Transcations.pdf 
Transaction Date,Description,Amount,Currency
10/26/2012 8:15:31 PM,Delikatesy Alma,-7.83,USD
10/26/2012 12:25:14 AM,DEEZER,-4.87,USD
10/23/2012 6:28:09 AM,SJO Empik,-23.17,USD
...
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
