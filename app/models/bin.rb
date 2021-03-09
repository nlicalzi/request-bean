class Bin < ApplicationRecord
  before_create :generate_url
  validates :name, length: { in: 3..50 }

  has_many :requests

  private

  def generate_url
    self.url = SecureRandom.hex 4
  end
end
