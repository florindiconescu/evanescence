require "evanescence/cacheable"

RSpec.describe Evanescence::Cacheable do
  let(:class_with_cache) { Class.new { extend Evanescence::Cacheable } }

  describe "#caches" do
    subject { class_with_cache.caches(by: :name, max_size: 10) }

    it "sets up caching options" do
      subject
      expect(class_with_cache.send(:by)).to eq(:name)
      expect(class_with_cache.send(:max_size)).to eq(10)
      expect(class_with_cache.send(:cache)).to be_a Evanescence::Cache
    end
  end

  describe "#get_by" do
    subject { class_with_cache.get_by("key") }

    let(:cache) { instance_double(Evanescence::Cache, read: nil, write: nil) }

    before do
      allow(Evanescence).to receive(:initialize_cache).and_return(cache)
      class_with_cache.caches(by: :name, max_size: 10)
    end

    context "when object present in the cache" do
      let(:cached_object) { double }

      before { allow(cache).to receive(:read).and_return(cached_object) }

      it "retrieves object from cache if present" do
        expect(subject).to eq(cached_object)
        expect(cache).not_to have_received(:write)
      end
    end

    context "when object not present in the cache" do
      let(:database_object) { double }

      before { allow(class_with_cache).to receive(:find_by_name).and_return(database_object) }

      it "fetches object from database" do
        expect(subject).to eq(database_object)
        expect(class_with_cache).to have_received(:find_by_name).with("key")
        expect(cache).to have_received(:write).with("key", database_object)
      end
    end
  end
end
