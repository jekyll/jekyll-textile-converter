require File.dirname(__FILE__) + '/spec_helper'

RSpec.describe(Jekyll::Converters::Textile) do
  let(:configs)   { Hash.new }
  let(:converter) { described_class.new(configs) }

  context "RedCloth default (no explicit config) hard_breaks enabled" do
    it "preserves single line breaks in HTML output" do
      expect(converter.convert("p. line1\nline2").strip).to eq("<p>line1<br />\nline2</p>")
    end
  end

  context "Default hard_breaks enabled w/ redcloth section, no hard_breaks value" do
    let(:configs)   { {'redcloth' => Hash.new} }

    it "preserves single line breaks in HTML output" do
      expect(converter.convert("p. line1\nline2").strip).to eq("<p>line1<br />\nline2</p>")
    end
  end

  context "RedCloth with hard_breaks enabled" do
    let(:configs) { {'redcloth' => {'hard_breaks' => true}} }

    it "preserves single line breaks in HTML output" do
      expect(converter.convert("p. line1\nline2").strip).to eq("<p>line1<br />\nline2</p>")
    end
  end

  context "RedCloth with hard_breaks disabled" do
    let(:configs) { {'redcloth' => {'hard_breaks' => false}} }

    it "does not generate break tags in HTML output" do
      expect(converter.convert("p. line1\nline2").strip).to eq("<p>line1\nline2</p>")
    end
  end

  context "RedCloth w/no_span_caps set to false" do
    let(:configs) { {'redcloth' => {'no_span_caps' => false}} }

    it "generates span tags around capitalized words" do
      expect(converter.convert("NSC").strip).to eq("<p><span class=\"caps\">NSC</span></p>")
    end
  end

  context "RedCloth w/no_span_caps set to true" do
    let(:configs) { {'redcloth' => {'no_span_caps' => true}} }

    it "does generates span tags around capitalized words" do
      expect(converter.convert("NSC").strip).to eq("<p>NSC</p>")
    end
  end
end
