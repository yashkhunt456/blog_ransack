class Article < ApplicationRecord
  has_many :comments
    paginates_per 5
    validates :title, presence: true
    validates :content, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["title", "content", "created_at", "updated_at", "id"]
      end

end
