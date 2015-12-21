class Indicator < ActiveRecord::Base
  has_many :indicator_junior_companies
  has_many :junior_companies, through: :indicator_junior_companies
  has_many :indicator_federations
  has_many :federations, through: :indicator_federations
end
