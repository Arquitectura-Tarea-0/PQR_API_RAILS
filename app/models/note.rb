# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :request, touch: true
  belongs_to :user
end