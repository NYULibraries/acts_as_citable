require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  test "should be able to create a new Record" do
    rec = Record.new(:data => "itemType: book", :format => "csf")
    assert rec.to_ris.eql? "TY  - BOOK\nER  -\n\n"
    assert rec.to_bibtex.eql? "@book{????\n}"
    assert rec.to_openurl.eql? "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rft.rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book"
    assert rec.to_easybib.eql? "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[{}]}"
  end
end
