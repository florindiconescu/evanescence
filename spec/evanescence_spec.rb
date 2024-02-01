RSpec.describe Evanescence do
  it "has a version number" do
    expect(described_class::VERSION).not_to be_nil
  end

  describe "cache" do
    subject(:cache) { described_class.initialize_cache(max_size:) }

    let(:max_size) { 3 }

    before do
      cache.write("key1", "val1")
      cache.write("key2", "val2")
      cache.write("key3", "val3")
    end

    it "generally works" do
      expect(cache.to_h).to eq({"key1" => "val1", "key2" => "val2", "key3" => "val3"})
      expect(cache.read("key1")).to eq("val1")
      expect(cache.write("key4", "val4")).to eq("val4")
      expect(cache.to_h).to eq({"key1" => "val1", "key3" => "val3", "key4" => "val4"})
      cache.clear
      expect(cache.to_h).to eq({})
    end
  end
end
