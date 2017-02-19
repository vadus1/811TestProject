require 'rails_helper'

describe LocationsHelper do
  let!(:location) { create(:location, area: 'POLYGON((45 0, 45 1, 55 0))') }

  describe '#points_coordinates' do
    it 'returns hash with points coordinates' do
      expect(helper.points_coordinates(location)).to eq(points_coordinates)
    end
  end

  describe '#data_for_google_map' do
    it 'returns json data for google map' do
      expect(helper.data_for_google_map).to eq(
        "[{\"name\":\"#{location.name}\",\"points_coordinates\":#{points_coordinates.to_json}}]"
      )
    end
  end

  private

  def points_coordinates
    [
      { lat: 45.0, lng: 0.0 },
      { lat: 45.0, lng: 1.0 },
      { lat: 55.0, lng: 0.0 },
      { lat: 45.0, lng: 0.0 }
    ]
  end
end
