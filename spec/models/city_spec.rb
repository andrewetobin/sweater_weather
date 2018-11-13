require 'rails_helper'

describe City, type: :model do
  describe 'relationships' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :state}
    it { should have_many :favorites }
    it { should have_many :users }
  end 
end
