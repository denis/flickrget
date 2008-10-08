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
        @path = '/rsp/photos'

      # Get photos in the given set
      when 'photosets'
        @url  = "flickr.photosets.getPhotos&photoset_id=#{id}"
        @path = '/rsp/photoset'

      # Get favorite public photos for the given user
      when 'favorites'
        @url  = "flickr.favorites.getPublicList&user_id=#{id}"
        @path = '/rsp/photos'

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
    result, page, pages  = [], 1, 1

    while page <= pages do
      doc = Hpricot(open("#{@url}&page=#{page}"))

      doc.search("#{@path}/photo").each do |p|
        result << "http://farm#{p['farm']}.static.flickr.com/#{p['server']}/#{p['id']}_#{p['originalsecret']}_o.#{p['originalformat']}"
      end

      if page == 1
        pages = doc.at(@path)['pages'].to_i
      end
      page += 1
    end

    puts "#{result.size} photo(s) founded\n"
    result
  end
end
