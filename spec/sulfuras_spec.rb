require 'sulfuras'

describe "updating Sulfuras" do
  context "before sell-in date" do
    it "does not change the sell-in date" do
      items = [Sulfuras.new("Sulfuras, Hand of Ragnaros", 2, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 2
    end

    it "does not change the quality" do
      items = [Sulfuras.new("Sulfuras, Hand of Ragnaros", 2, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end
  end

  context "after sell-in date" do
    it "does not change the sell-in date" do
      items = [Sulfuras.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it "does not change the quality" do
      items = [Sulfuras.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end
  end
end
