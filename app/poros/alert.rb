class Alert
  attr_reader :id, :url, :title, :description, :category, :last_index

  def initialize(data)
    @id = data[:id]
    @url = formatted_url(data[:url])
    @title = data[:title]
    @description = data[:description]
    @category = data[:category]
    @last_index = data[:lastIndexedDate]
  end

  def formatted_url(url)
    return 'No link available.' if url.empty?

    url
  end
end
