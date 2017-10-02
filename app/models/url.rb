class Url < ActiveRecord::Base
  validates :long_url, presence: true, format: {with: /\w{4,5}:\/\/\w{2,}\.\w{2,}(\.\w{2,})?/, message: "invalid url"}
  validates :short_url, presence: true

  def add_short_url
    self.short_url = SecureRandom.hex(4)
  end

  def self.retrieve_short_url(long_url)
    @url = Url.find_by(long_url: long_url)
    if @url
      @url.short_url
    end
  end
end
