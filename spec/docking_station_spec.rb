require 'docking_station'

# In spec/docking_station_spec.rb
describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'should check if capacity variable has been set' do
    expect {DockingStation}.to respond_to(:new).with(1).argument)
  end
  
  describe '#release_bike' do
    it 'releases working bikes' do
      #bike = subject.release_bike
      #expect(bike).to be_working
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end
    
    it 'does not release a bike if none are availble' do
      expect { subject.release_bike }.to raise_error("no availble bikes")
    end
  
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike }

  describe "#dock" do
    it 'raises an error when capacity is reached' do
      subject.DEAFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error("docking station capacity exceeded")
    end  
  
    it 'checking a bike is docked' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike_array.include?(bike)).to eq (true)
    end

  
  end  

end

