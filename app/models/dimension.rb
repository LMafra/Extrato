class Dimension < ActiveRecord::Base
  belongs_to :perfomance
  has_many :questions
  has_many :perfomance_answers
end
