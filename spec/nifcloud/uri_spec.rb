require "spec_helper"

RSpec.describe Nifcloud::Uri do
  it "has a version number" do
    expect(Nifcloud::Uri::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
