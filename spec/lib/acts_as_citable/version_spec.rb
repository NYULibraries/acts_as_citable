require 'spec_helper'

describe ActsAsCitable do
  describe "VERSION" do
    subject { described_class::VERSION }
    it { is_expected.to_not be_nil }
  end
end
