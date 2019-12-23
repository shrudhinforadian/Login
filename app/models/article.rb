# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true,
                    length: { minimum: 5 }
end
