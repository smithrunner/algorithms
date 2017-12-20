class Node
attr_accessor :hash
attr_accessor :data
    
  def initialize(data,hash)
    @data = data
    @hash = hash
  end
end