require 'aged_brie'

describe "updating Aged Brie" do
  context "before sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Aged_brie.new("Aged Brie", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
    end

    it "increase the quality by 1" do
      items = [Aged_brie.new("Aged Brie", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
    end

    it "cannot increase the quality beyond 50" do
      items = [Aged_brie.new("Aged Brie", 2, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end

  context "after sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Aged_brie.new("Aged Brie", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
    end

    it "increase the quality by 2" do
      items = [Aged_brie.new("Aged Brie", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
    end

    it "cannot increase the quality beyond 50" do
      items = [Aged_brie.new("Aged Brie", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end
end
