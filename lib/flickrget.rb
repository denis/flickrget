require 'hpricot'
require 'open-uri'

class Flickrget
  def self.download_all(type, ids)
    ids.each do |id|
      self.new(type, id).download
    end
  end

  def initialize(type, id)
    case type
      # Get public photos for the given user
      when 'people'
        @url  = "flickr.people.getPublicPhotos&user_id=#{id}"
        @path = '/rsp/photos/photo'

      # Get photos in the given set
      when 'photosets'
        @url  = "flickr.photosets.getPhotos&photoset_id=#{id}"
        @path = '/rsp/photoset/photo'

      # Get favorite public photos for the given user
      when 'favorites'
        @url  = "flickr.favorites.getPublicList&user_id=#{id}"
        @path = '/rsp/photos/photo'

      else
        raise
    end

    @url = "http://api.flickr.com/services/rest/?method=#{@url}&extras=original_format&api_key=1b6d69170a6a5ab2fa502a32c870fd2f"
  end

  def download
    photos = photos_urls.each do |url|
      open(url.split('/').last, 'w').write(open(url).read)
      STDOUT.print(".")
      STDOUT.flush
    end
    puts "\n#{photos.size} photo(s) saved\n"
  end

  private

  def photos_urls
    doc = Hpricot(open(@url))
    doc.search(@path).map do |photo|
      "http://farm#{photo.get_attribute('farm')}.static.flickr.com/#{photo.get_attribute('server')}/#{photo.get_attribute('id')}_#{photo.get_attribute('originalsecret')}_o.#{photo.get_attribute('originalformat')}"
    end
  end
end
