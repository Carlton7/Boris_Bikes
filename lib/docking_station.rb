require_relative 'bike'

class DockingStation
  def initialize() 
    @bike_array = []
    @DEAFAULT_CAPACITY = 20
    # @capacity = capacity
  end
  def release_bike
    fail 'no availble bikes' if empty?
    Bike.new
  end
  def dock(bike)
    fail 'docking station capacity exceeded' if full?
    @bike_array << bike 
  end
  attr_reader :bike_array, :DEAFAULT_CAPACITY


  private
  def full?
    @bike_array.length >= @DEAFAULT_CAPACITY ? true : false
  end
  def empty?
    @bike_array.length == 0 ? true : false
  end
end

