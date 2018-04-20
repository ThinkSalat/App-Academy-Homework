class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.lookup(key)
      @map.each_index do |i|
        @map[i][1] = value if @map[i][0] == key
      end
    else
      @map << [key,value]
    end
    @map
  end

  def lookup(key)
    @map.each do |(k,v)|
      return v if k == key
    end
    nil
  end

  def remove(key)
    if @map.lookup(key)
      @map.reject! {|(k,v)| k == key}
    else
      nil
    end
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(map)
    map.map {|el| el.is_a? Array ? deep_dup(el): el}
  end
end
