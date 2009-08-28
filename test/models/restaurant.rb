class Restaurant < ActiveRecord::Base
  has_slug :name,
           :scope => :city,
           :preserve => '.'
  
  belongs_to :city
  
  belongs_to :kitchen
end