
def possible_bipartition(dislikes)
  return true if dislikes.empty?
  groups = Array.new(dislikes.length)
  groups.each_index do |n|
    if groups[n].nil? 
      groups[n] = 0
      queue = []
      queue.push(n)
      while queue.length > 0 
        curr_index = queue.shift
        dogs_we_hate = dislikes[curr_index]
        dogs_we_hate.each do |dog|
          if groups[dog].nil?
            groups[dog] = 1 - groups[curr_index]
            queue.push(dog)
          else
            return false if groups[dog] != 1 - groups[curr_index]
          end 
        end
      end 
    end 
  end 
  return true
end
