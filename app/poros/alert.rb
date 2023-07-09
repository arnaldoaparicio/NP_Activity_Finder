class Alert
  attr_reader :id, :url, :title, :description, :category, :last_index

  def initialize(data)
    @id = data[:id]
    @url = data[:url]
    @title = data[:title]
    @description = data[:description]
    @category = data[:category]
    @last_index = data[:lastIndexedDate]
  end


end
