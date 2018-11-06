require 'rails_helper'

describe ForecastFinder, type: :model do
  it "exists" do
    VCR.use_cassette("ForecastFinder model test") do

      cord_finder = CordFinder.new("denver,co")
      forecast_finder = ForecastFinder.new(cord_finder)

      expect(forecast_finder).to be_a(ForecastFinder)
      expect(forecast_finder.coordinates).to eq("39.7392358,-104.990251")
      expect(forecast_finder.formatted_address).to eq("Denver, CO, USA")
    end
  end
end
