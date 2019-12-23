# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
  has_many :articles , dependent: :destroy
  validates :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true, presence: true,
                       length: { minimum: 8 }, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email
end
