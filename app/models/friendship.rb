class Friendship < ApplicationRecord
  belongs_to :sent_to, class_name: 'User', foreign_key: 'sent_to_id'
  belongs_to :sent_by, class_name: 'User', foreign_key: 'sent_by_id'
  scope :friends, -> { where('status =?', true) }
  scope :not_friends, -> { where('status =?', false) }

  validates :sent_by_id, presence: true
  validates :sent_to_id, presence: true
  validates_uniqueness_of :sent_by_id, :scope => :sent_to_id
end
