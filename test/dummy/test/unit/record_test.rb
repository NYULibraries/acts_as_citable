require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  test "should be able to create a new Record" do
    rec = Record.new(:data => "itemType: book", :format => "csf")
    assert_equal "TY  - BOOK\nER  -\n\n", rec.to_ris
    assert_equal "@book{????\n}", rec.to_bibtex
    assert_equal "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rft.rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book", rec.to_openurl
    assert_equal "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[]}", rec.to_easybib
  end
end
