class PerfomanceAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :userLogged
  belongs_to :perfomance
  belongs_to :dimension
  belongs_to :question
end
