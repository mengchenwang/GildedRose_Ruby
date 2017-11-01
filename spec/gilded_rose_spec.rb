require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe "updating normal items" do
      context "before sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("foo", 2, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 1
        end

        it "decrease the quality by 1" do
          items = [Item.new("foo", 2, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 1
        end
      end

      context "after sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("foo", 0, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq(-1)
        end

        it "decrease the quality by 1" do
          items = [Item.new("foo", 0, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end
    end
  end



end
