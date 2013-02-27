class TestController < ApplicationController
  respond_to :ris, :bibtex, :json
  def test
    rec = Record.create(:data => "itemType: book", :format => "csf")
    zip = Array.new
    zip << rec
    respond_with(zip)
  end
end