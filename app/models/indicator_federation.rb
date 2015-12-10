class IndicatorFederation < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :federation
end
