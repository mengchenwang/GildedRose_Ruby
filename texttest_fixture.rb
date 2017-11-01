require_relative 'lib/gilded_rose'
require_relative 'lib/normal_item'
require_relative 'lib/aged_brie'
require_relative 'lib/sulfuras'
require_relative 'lib/backstage_pass'
require_relative 'lib/conjured'

puts "OMGHAI!"
items = [
  Normal_item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Aged_brie.new(name="Aged Brie", sell_in=2, quality=0),
  Normal_item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  Backstage_pass.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Backstage_pass.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Backstage_pass.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  # This Conjured item does not work properly yet
  Conjured.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
]

days = 20
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
