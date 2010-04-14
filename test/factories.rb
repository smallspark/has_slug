begin
  Factory.define :city do |f|
    f.name 'New York'
  end

  Factory.define :kitchen do |f|
    f.name 'Italian'
  end

  Factory.define :restaurant do |f|
    f.name    'Da Marco'
    f.city    { |city| city.association(:city) }
    f.kitchen { |kitchen| kitchen.association(:kitchen) }
  end
rescue Factory::DuplicateDefinitionError
end