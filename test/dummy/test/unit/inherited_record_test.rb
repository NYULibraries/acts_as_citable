require 'test_helper'

class InheritedRecordTest < ActiveSupport::TestCase
  test "should be able to create a new Inherited Record" do
    rec = InheritedRecord.new(:data => "itemType: book", :format => "csf")
    assert_equal "TY  - BOOK\nER  -\n\n", rec.to_ris
    assert_equal "@book{????\n}", rec.to_bibtex
    assert_equal "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book", rec.to_openurl
    assert_equal "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[]}", rec.to_easybib
  end

  test "should check if i can use the Inherited record" do
    assert rec = InheritedRecord.new( :data => "data", :format => "from_format")
    assert rec.destroy
  end

  test "should check to see if format fields are set" do
    assert 'format', InheritedRecord.format_field
  end

  test "should check to see if Inherited records can be converted" do
    rec = InheritedRecord.new(:data => "itemType: book", :format => "csf")
    assert rec.respond_to?(:to_ris)
    assert rec.respond_to?(:to_bibtex)
    assert rec.respond_to?(:to_openurl)
    assert rec.respond_to?(:to_csf)
    assert rec.respond_to?(:to_easybib)
    assert rec.respond_to?(:to_refworks_tagged)
    assert rec.respond_to?(:csf)
    assert rec.destroy
  end

  # test "should work with models inherited acts_as_citable models" do
  #   rec = InheritedRecord.new(:data => "itemType: book", :format => "csf")
  #   assert_equal "TY  - BOOK\nER  -\n\n", rec.to_ris
  #   assert_equal "@book{????\n}", rec.to_bibtex
  #   assert_equal "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book", rec.to_openurl
  #   assert_equal "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[]}", rec.to_easybib
  #   assert rec.destroy
  # end

  test "should check to see if you cannot convert from" do
    rec = InheritedRecord.new(:data => "itemType: book", :format => "csf")
    assert !rec.respond_to?(:from_ris)
    assert !rec.respond_to?(:from_bibtex)
    assert !rec.respond_to?(:from_openurl)
    assert !rec.respond_to?(:from_csf)
    assert !rec.respond_to?(:from_pnx)
  end

  test "should raise no method error" do
    rec = Record.new(:data => "itemType: book", :format => "csf")
    assert_raise NoMethodError do
      rec.from_ris
    end
    assert rec.destroy
  end

  test "should be available to convert to" do
    rec = InheritedRecord.new(:data => "itemType: book", :format => "csf")
    assert_equal "TY  - BOOK\nER  -\n\n", rec.to_ris
    assert_equal "@book{????\n}", rec.to_bibtex
    assert_equal "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book", rec.to_openurl
    assert_equal "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[]}", rec.to_easybib
    assert rec.destroy
  end

  test "should be able to convert to an export STYLE" do
    rec = InheritedRecord.new(:data => "itemType: book", :format => "csf")
    assert_equal "<div class=\"csl-bib-body\">\n  <div class=\"csl-entry\"> (n.d.).</div>\n</div>", rec.to_apa
    assert_equal "<div class=\"csl-bib-body\">\n  <div class=\"csl-entry\"> Print.</div>\n</div>", rec.to_mla
    assert_equal "<div class=\"csl-bib-body\">\n\n[CSL STYLE ERROR: reference with no printed form.]\n</div>", rec.to_chicago_author_date
  end

end
