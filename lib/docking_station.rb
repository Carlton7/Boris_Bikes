require_relative 'bike'

class DockingStation
  def release_bike
    fail 'no availble bikes' unless @bike
    @bike
  end
  def dock(bike)
    fail 'docking station capacity exceeded' if @bike
    @bike = bike
  end
  attr_reader :bike
end

