acts_as_citable
===============
[![Build Status](https://travis-ci.org/NYULibraries/acts_as_citable.svg?branch=master)](https://travis-ci.org/NYULibraries/acts_as_citable)
[![Coverage Status](https://coveralls.io/repos/github/NYULibraries/acts_as_citable/badge.svg?branch=master)](https://coveralls.io/github/NYULibraries/acts_as_citable?branch=master)
[![Gem Version](https://badge.fury.io/rb/acts_as_citable.svg)](https://badge.fury.io/rb/acts_as_citable)
[![Maintainability](https://api.codeclimate.com/v1/badges/c0f67ceb0bd39473a368/maintainability)](https://codeclimate.com/github/NYULibraries/acts_as_citable/maintainability)

Acts as gem for Citero. This gem allows an object to utilize Citero's translating properties.

Config
======
Simply put acts_as_citable in your model. If you have attributes named _data_ and _format_, you are set. If you must configure, do the following.

```
    acts_as_citable do |c|
    	c.format_field = 'your_format_field_name'
    	c.data_field = 'your_data_field_name'
	  end
```
How to use
==========
Using acts_as_citable is easy! Once you have your model configured, simply use the _to\_format_ method on your model where _format_ is one of the desired formats.

* BibTeX
* RIS
* OpenURL
* EasyBib
* CSF (**C**itero **S**tandard **F**ormat)

The results are returned as string. Additionally, you can have it render the format with a responds with action. You must have something like this in your controller.

    class TestController < ApplicationController
    	respond_to :ris, :bibtex, :json
    	def test
    		rec = Record.create(:data => "itemType: book", :format => "csf")
    		arr = Array.new
    		arr << rec
    		respond_with(arr)
    	end
    end

Finally, to interact with the CSF object, you can call the _csf_ method.

    rec = Record.create(:data => "itemType: book", :format => "csf")
    csf = rec.csf
    p csf.itemType # => Prints ['book']
    p csf.keys # => Prints ['itemType']
