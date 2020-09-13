# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user
  has_many :notes
  enum request_state: %i[settled in_progress solved closed]
  before_create :default_state

  def default_state
  	self.request_state = 0
  end
end