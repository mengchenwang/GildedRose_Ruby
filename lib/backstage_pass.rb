require_relative 'item'

class Backstage_pass < Item
  def update
    @quality += 1 if @sell_in > 0 && @quality < 50
    @quality += 1 if @sell_in <= 10 && @quality < 50
    @quality += 1 if @sell_in <= 5 && @quality < 50
    @quality = 0 if @sell_in <= 0
    @sell_in -= 1
  end
end
