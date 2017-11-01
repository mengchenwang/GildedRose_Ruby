require_relative 'item'

class GildedRose

  SPECIAL_ITEMS = ["Aged Brie", "Sulfuras", "Backstage pass", "Conjured"]

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      special_item?(item) ? update_special_items(item) : Normal_item.update(item)
    end
  end

  def special_item?(item)
    SPECIAL_ITEMS.any? { |short_name| item.name.include?(short_name) }
  end

  def update_special_items(item)
    SPECIAL_ITEMS.each do |short_name|
      if item.name.include?(short_name)
        item_class_name = short_name.tr(' ', '_')
        Object.const_get(item_class_name).update(item)
      end
    end
  end
end
