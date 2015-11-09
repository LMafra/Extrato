class Question < ActiveRecord::Base
  belongs_to :dimension
  has_many :perfomance_answers
end
