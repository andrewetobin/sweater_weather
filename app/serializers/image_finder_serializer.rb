class ImageFinderSerializer < ActiveModel::Serializer
  attributes :url

  def random
    object.info[:photos][:photo][rand(0..(object.info[:photos][:perpage]-1))]
  end

  def url
    random[:url_l]
  end

end
