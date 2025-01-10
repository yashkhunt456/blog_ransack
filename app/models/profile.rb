class Profile < ApplicationRecord
  belongs_to :user
  validates :full_name, :age, presence: true
end
