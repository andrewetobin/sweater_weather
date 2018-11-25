class FavoriteSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer

  attribute :location do |object|
    "#{object.city.name}, #{object.city.state}"
  end


end
