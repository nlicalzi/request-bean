# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :bin

  validates :payload, presence: true
end
