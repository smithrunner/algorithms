require_relative 'node'

class NearestNeighbor
  attr_accessor :map
  attr_accessor :visited

  def initialize(node,map)
    @start = node
    @map = map
    @visited = []
  end
  
  def route(node)
    @visited << node.data
    
    next_node = find_nearest(node)
    remove_from_map(node)
    
    if @map.length == 1
      @visited << @map[0].data
      print_visited()
    else
      route(next_node)
    end
    
    
  end
  
  private
  
  def find_nearest(node)
    shortest = 99
    shortest_node = ''
    node.hash.each do |key, value|
      if value < shortest
        shortest = value
        shortest_node = key
      end
    end
    
    @map.each do |i|
      if i.data == shortest_node
        return i
      end
    end
    
  end
  
  def remove_from_map(node)
    @map.delete(node)
  end
  
  def print_visited
    @visited.each do |node|
      puts node
    end
  end
end

alpha_hash = {'b'=>3,'c'=>5}
beta_hash = {'a'=>3,'d'=>2,'e'=>8}
camo_hash = {'a'=>5,'e'=>4,'f'=>16}
delta_hash = {'b'=>2,'e'=>1}
echo_hash = {'b'=>8,'c'=>4,'f'=>7}
fam_hash = {'c'=>16,'e'=>7}

alpha = Node.new('a',alpha_hash)
beta = Node.new('b',beta_hash)
camo = Node.new('c',camo_hash)
delta = Node.new('d',delta_hash)
echo = Node.new('e',echo_hash)
fam = Node.new('f',fam_hash)

map = [alpha,beta,camo,delta,echo,fam]

nn = NearestNeighbor.new(alpha,map)
nn.route(alpha)

