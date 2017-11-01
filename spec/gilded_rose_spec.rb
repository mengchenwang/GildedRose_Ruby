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

    describe "updating Aged Brie" do
      context "before sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Aged Brie", 2, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 1
        end

        it "increase the quality by 1" do
          items = [Item.new("Aged Brie", 2, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 3
        end
      end

      context "after sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Aged Brie", 0, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq(-1)
        end

        it "increase the quality by 2" do
          items = [Item.new("Aged Brie", 0, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 4
        end
      end
    end

    describe "updating Sulfuras" do
      context "before sell-in date" do
        it "does not change the sell-in date" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 2, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 2
        end

        it "does not change the quality" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 2, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 80
        end
      end

      context "after sell-in date" do
        it "does not change the sell-in date" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 0
        end

        it "does not change the quality" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 80
        end
      end
    end

    describe "updating Backstage passes" do
      context "11 days before sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 10
        end

        it "increase the quality by 1" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 11
        end
      end

      context "10 days before sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 9
        end

        it "increase the quality by 2" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 12
        end
      end

      context "5 days before sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 4
        end

        it "increase the quality by 3" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 13
        end
      end

      context "after sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq(-1)
        end

        it "decrease the quality to 0" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end
    end

    describe "updating Conjured items" do
      context "before sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Conjured Mana Cake", 2, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 1
        end

        it "decrease the quality by 2" do
          items = [Item.new("Conjured Mana Cake", 2, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end

      context "after sell-in date" do
        it "decrease the sell-in date by 1" do
          items = [Item.new("Conjured Mana Cake", 0, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq(-1)
        end

        it "decrease the quality by 4" do
          items = [Item.new("Conjured Mana Cake", 0, 4)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end
    end
  end
end
