# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user
  has_many :notes
end