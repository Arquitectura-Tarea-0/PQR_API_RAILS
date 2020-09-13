# frozen_string_literal: true

class User < ApplicationRecord
  has_many :requests
  has_many :notes
  has_secure_password
  enum role: %i[admin requester]
  validates :email, uniqueness: true
  validates_presence_of :email

end