class Perfomance < ActiveRecord::Base
  belongs_to :junior_companies
  belongs_to :federations
  belongs_to :role
  has_many :dimensions
end
