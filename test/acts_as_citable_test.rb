require 'test_helper'
require 'ruby-debug'

class ActsAsCitableTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ActsAsCitable
  end

  test "new nokogiri xml document" do
    assert_nothing_raised("New Nokogiri::XML::Document raises an error.") {
      Nokogiri::XML::Document.new
    }
  end
end
