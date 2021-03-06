require 'backstage_pass'

describe "updating Backstage passes" do
  context "11 days before sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 10
    end

    it "increase the quality by 1" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it "cannot increase the quality beyond 50" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 11, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end

  context "10 days before sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "increase the quality by 2" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end

    it "cannot increase the quality beyond 50" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end

  context "5 days before sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
    end

    it "increase the quality by 3" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end

    it "cannot increase the quality beyond 50" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end

  context "after sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
    end

    it "decrease the quality to 0" do
      items = [Backstage_pass.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
