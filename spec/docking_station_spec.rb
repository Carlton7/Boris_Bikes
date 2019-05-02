require 'docking_station'

# In spec/docking_station_spec.rb
describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end
  
  describe '#release_bike' do
    it 'releases working bikes' do
      #bike = subject.release_bike
      #expect(bike).to be_working
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end
    it 'does not release a bike if none are availble' do
      expect { subject.release_bike }.to raise_error("no availble bikes")
    end
  
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike }

  describe "#dock" do
    it 'checking bike is docked' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq(bike)
    end

    it 'raises an error when capacity is reached' do
      subject.dock(Bike.new)
      expect { subject.dock(Bike.new) }.to raise_error("docking station capacity exceeded")
    end  
  end

  it 'returns a bike to dock' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end

end

