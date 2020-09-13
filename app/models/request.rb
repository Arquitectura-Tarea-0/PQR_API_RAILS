# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user
  has_many :notes
  enum request_state: %i[settled in_progress solved closed]

  def default_state
  	self.update(request_state: 0)
  end
end