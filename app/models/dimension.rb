class Dimension < ActiveRecord::Base
  belongs_to :perfomance
  has_many :question
end
