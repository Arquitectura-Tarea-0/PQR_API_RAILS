# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user
  has_many :notes
  enum request_state: %i[settled in_progress solved closed]
  after_commit :notify_update

  def notify_update
    RequestMailer.notice_request(user, self).deliver_now
    User.where(role: :admin).each do |u|
    	RequestMailer.notice_request(u, self).deliver_now
	end
  end
end