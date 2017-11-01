require 'gilded_rose'

describe GildedRose do
  let(:item1) { double(:item1) }
  let(:item2) { double(:item2) }

  describe '#initialize' do
    it 'saves items into @items variable' do
      gilded_rose = GildedRose.new(1)
      expect(gilded_rose.items).to eq 1
    end
  end

  describe '#update_quality' do
    it 'calls update method on item1 and item2' do
      allow(item1).to receive(:update)
      allow(item2).to receive(:update)
      items = [item1, item2]
      gilded_rose = GildedRose.new(items)
      expect(item1).to receive(:update)
      expect(item2).to receive(:update)
      gilded_rose.update_quality
    end
  end
end
