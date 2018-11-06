require 'rails_helper'


describe CordFinder, type: :model do
  describe "instance methods" do
    it "#coordinates" do

      VCR.use_cassette("coordinates instance method") do
        cord_finder = CordFinder.new("denver,co")


        expect(cord_finder.coordinates).to eq([39.7392358, -104.990251])
      end
    end
    it "#formatted_address" do

      VCR.use_cassette("formatted_address instance method") do
        cord_finder = CordFinder.new("denver,co")


        expect(cord_finder.formatted_address).to eq("Denver, CO, USA")
      end
    end

  end
end
