class AccessiblePlace

    attr_reader :places

    def initialize(data)
      @places = data[0][:parks][0][:places]
      # binding.pry 
    end
    

end