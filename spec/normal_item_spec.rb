require 'normal_item'

describe "updating normal items" do
  context "before sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Normal_item.new("foo", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
    end

    it "decrease the quality by 1" do
      items = [Normal_item.new("foo", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it "cannot decrease the quality beyond 0" do
      items = [Normal_item.new("foo", 2, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

  context "after sell-in date" do
    it "decrease the sell-in date by 1" do
      items = [Normal_item.new("foo", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
    end

    it "decrease the quality by 2" do
      items = [Normal_item.new("foo", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "cannot decrease the quality beyond 0" do
      items = [Normal_item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
