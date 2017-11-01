require_relative 'item'

class Normal_item < Item
  def update
    @quality -= 1 if @quality > 0
    @quality -= 1 if @sell_in <= 0 && @quality > 0
    @sell_in -= 1
  end
end
