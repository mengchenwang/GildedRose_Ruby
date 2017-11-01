require_relative 'item'

class Conjured < Item
  def update
    2.times { @quality -= 1 if @quality > 0 }
    2.times { @quality -= 1 if @sell_in <= 0 && @quality > 0 }
    @sell_in -= 1
  end
end
