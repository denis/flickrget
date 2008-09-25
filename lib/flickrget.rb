class Flickrget
  # Get public photos for the given user
  def self.user(user_id)
    "http://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&user_id=#{user_id}&extras=original_format"
  end

  # Get photos in the given set
  def self.set(photoset_id)
    "http://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&photoset_id=#{photoset_id}&extras=original_format"
  end

  # Get favorite public photos for the given user
  def self.favorites(user_id)
    "http://api.flickr.com/services/rest/?method=flickr.favorites.getPublicList&user_id=#{user_id}&extras=original_format"
  end
end