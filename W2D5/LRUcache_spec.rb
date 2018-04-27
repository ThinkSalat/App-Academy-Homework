require 'rspec'
require_relative 'LRUcache'

describe LRUCache do
  subject(:cache) {LRUCache.new(4)}
  describe "#initialize" do
    it 'takes in a cache size' do
      expect(cache.size).to eq(4)
    end
  end

  describe "#count" do
    it "returns the number of items in the cache" do
      expect(cache.count).to eq(0)
      cache.add(1)
      expect(cache.count).to eq(1)
    end
  end

  describe "#add" do

    it "adds passed in element to end of cache" do

    end
    it "doesn't allow multiple of same item" do
      cache.add(0)
      cache.add(0)
      expect(cache.show).to eq([0])
    end

    context "When full" do
      it "removes the least recently used item" do
        cache.add(0)
        cache.add(1)
        cache.add(2)
        cache.add(3)
        cache.add(4)
        expect(cache.show).to_not include(0)
      end
    end
  end

end
