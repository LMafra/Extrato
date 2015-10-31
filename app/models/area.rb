class Area < ActiveRecord::Base
  belongs_to:organogram
  has_many:role
  has_many :subareas, class_name: "Area",
                          foreign_key: "subarea_id"
 
  belongs_to :subarea, class_name: "Area"
end