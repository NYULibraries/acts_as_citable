require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should respond to bibtex" do
    get :test, :format => "bibtex", :use_route => :test
    assert_response :success
  end
  test "should respond to bib" do
    get :test, :format => "bib", :use_route => :test
    assert_response :success
  end
  test "should respond to ris" do
    get :test, :format => "ris", :use_route => :test
    assert_response :success
  end
  test "should not respond to arbitrary format" do
    assert_raise ActionController::UnknownFormat do
      get :test, :format => "bugaboo", :use_route => :test
      assert_response :not_acceptable
    end
  end
end
