# frozen_string_literal: true

RSpec.describe RubyTypist do
  it "has a version number" do
    expect(RubyTypist::VERSION).not_to be nil
  end

  it "returns nil on empty array" do
    typist = RubyTypist::Typist.new

    expect(typist.typer([])).to eq(nil)
  end

  it "returns nil on input other than array" do
    typist = RubyTypist::Typist.new
    expect(typist.typer("")).to eq(nil)
    expect(typist.typer(1)).to eq(nil)
  end

  it "returns html output on valid input" do
    typist = RubyTypist::Typist.new
    expect(typist.typer(["nik"]).include?("nik")).to eq(true)
    expect(typist.typer(["nik"]).include?("id='ruby-typist'")).to eq(true)
  end
end
