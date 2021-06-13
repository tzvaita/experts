require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create!(name: 'Foobar', website: 'https://www.facebook.com')
  end
  context 'with valid details' do
    it 'should create a user' do
      expect(@user).to be_valid
    end

    it 'should have a name' do
      expect(@user.name).to be_present
    end

    it 'should have a website address' do
      expect(@user.website).to be_present
    end
  end

  context 'with invalid details' do
    it 'should not be valid' do
      @user.name = '    '
      expect(@user).to_not be_valid
    end

    it 'should not be valid' do
      @user.website = '    '
      expect(@user).to_not be_valid
    end
  end
  
end
