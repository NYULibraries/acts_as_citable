require 'test_helper'

class ActsAsCitableTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ActsAsCitable
  end
end

class RecordTest < ActiveSupport::TestCase
  test "should check if i can use the record" do
    assert rec = Record.create( :data => "data", :format => "from_format")
    assert rec.destroy
  end
  
  test "should check to see if format fields are set" do
    assert 'format', Record.format_field
    assert 'from_format', RecordChangedField.format_field
  end
  
  test "should check to see if records can be converted" do
    rec = Record.create(:data => "itemType: book", :format => "csf")
    assert rec.respond_to?(:to_ris) 
    assert rec.respond_to?(:to_bibtex)
    assert rec.respond_to?(:to_openurl)
    assert rec.respond_to?(:to_csf)
    assert rec.respond_to?(:to_easybib)
    assert rec.respond_to?(:csf)
  end
  
  test "should check to see if you cannot convert from" do
    rec = Record.create(:data => "itemType: book", :format => "csf")
    assert !rec.respond_to?(:from_ris) 
    assert !rec.respond_to?(:from_bibtex)
    assert !rec.respond_to?(:from_openurl)
    assert !rec.respond_to?(:from_csf)
    assert !rec.respond_to?(:from_pnx)
  end
  
  test "should raise no method error" do
    rec = Record.create(:data => "itemType: book", :format => "csf")
    assert_raise NoMethodError do
       rec.from_ris
     end
  end
  
  test "should be available to convert to" do
    rec = Record.create(:data => "itemType: book", :format => "csf")
    assert rec.to_ris.eql? "TY  - BOOK\nER  -\n\n"
    assert rec.to_bibtex.eql? "@book{????\n}"
    assert rec.to_openurl.eql? "?rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rft.rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book"
    assert rec.to_easybib.eql? "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[{}]}"
  end
  
  test "new nokogiri xml document" do
    assert_nothing_raised("New Nokogiri::XML::Document raises an error.") {
      Nokogiri::XML::Document.new
    }
  end
  
  test "arrays should be able to convert to ris and bibtex" do
    arr = Array.new
    arr << Record.create(:data => "itemType: book", :format => "csf") << Record.create(:data => "itemType: book", :format => "csf")
    assert arr.to_bibtex
    assert arr.to_ris
  end
  
end