class Team < ApplicationRecord
  has_many :kids, dependent: :destroy, inverse_of: :team

end
