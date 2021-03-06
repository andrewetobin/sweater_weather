require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:api_key) }
  end
  describe 'relationships' do
    it {should have_many :favorites}
    it {should have_many :cities}
  end
end
