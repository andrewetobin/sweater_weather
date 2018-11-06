require 'rails_helper'

describe ImageFinder, type: :model do
  it "exists" do
    VCR.use_cassette("ImageFinder model test") do

      cord_finder = CordFinder.new("denver,co")
      image_finder = ImageFinder.new(cord_finder)

      expect(image_finder).to be_a(ImageFinder)
      expect(image_finder.lat).to eq(39.7392358)
      expect(image_finder.lon).to eq(-104.990251)
    end
  end
end
