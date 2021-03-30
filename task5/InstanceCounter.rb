protected_methods(InstanceCounter)
module InstanceCounter

  def self.count_instances
    ObjectSpace.garbage_collect
    ObjectSpace.each_object(self).to_a.size
  end

end
