class City < ActiveRecord::Base
  has_slug :name
  
  has_many :restaurants
  
  has_many :kitchens,
           :through => :restaurants
end

class Kitchen < ActiveRecord::Base
  has_slug :name
  
  belongs_to :restaurant
end

class Restaurant < ActiveRecord::Base
  has_slug :name,
           :scope => :city,
           :preserve => '.'
  
  belongs_to :city
  
  belongs_to :kitchen
end