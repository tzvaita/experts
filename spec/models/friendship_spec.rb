require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @user1 = User.create!(name: 'Tenny', website: 'https://www.facebook.com')
    @user2 = User.create!(name: 'Taku', website: 'https://www.facebook.com')
    @user3 = User.create!(name: 'Tendy', website: 'https://www.facebook.com')
    @friend = Friendship.create!(sent_by_id: @user1.id, sent_to_id: @user2.id, status: true)
    @friend1 = Friendship.create(sent_by_id: @user3.id, sent_to_id: @user3.id, status: false)
  end

  context 'with valid details' do
    it 'should create friendship' do
      expect(@friend).to be_valid
    end

    it 'should have a friend' do
      expect(@user1.friends).not_to be_empty
    end

    it 'should not create a duplicate friendship' do
      dupli = @friend.dup
      expect(dupli).not_to be_valid
    end
  end
end
