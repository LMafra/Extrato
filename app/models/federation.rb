class Federation < ActiveRecord::Base
  has_many :junior_companies
  has_many :organograms
  has_many :perfomaces
  has_many :indicator_federations
  has_many :indicators, through: :indicator_federations
end
