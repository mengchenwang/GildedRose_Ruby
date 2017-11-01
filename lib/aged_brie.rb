require_relative 'item'

class Aged_brie < Item
  def update
    @quality += 1 if @quality < 50
    @quality += 1 if @sell_in <= 0 && @quality < 50
    @sell_in -= 1
  end
end
