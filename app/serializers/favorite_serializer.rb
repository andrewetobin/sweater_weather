class FavoriteSerializer < ActiveModel::Serializer
  attributes :favorites

  def favorites
    user = User.find(object.user_id)
    user.favorites.map do |favorite|
      city = City.find(favorite.city_id)
      "#{city.name}, #{city.state}"
    end
  end


end
