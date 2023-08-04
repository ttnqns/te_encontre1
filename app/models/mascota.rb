class Mascota < ApplicationRecord
  belongs_to :usuario
  validates :cualidad, presence: true
end
