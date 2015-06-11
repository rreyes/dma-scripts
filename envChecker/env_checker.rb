require "/Users/rene/dv/dma/ra-dma/env/env.dist.rb"

module Dist
   include Dma
end

path = Dist::Env


def generate_dist_set(path)
   items = {}
   path.constants.each do |constant|
      child_path = Kernel.const_get(path.name + '::' + constant.to_s)
      if child_path.is_a? Module
         items.merge!(generate_dist_set(child_path))
      else
         items["#{path.name}::#{constant}"] = child_path
      end
   end
   items
end

dist_set = generate_dist_set(path)
puts dist_set

#Dist::Env.ancestors.each do |a|
#  puts a
#end

