class Class
  def to_proc
    proc {|x,y| new x, y }
  end
end

puts [[1, "a"], [4, "b"], [3, "h"],[3, "c"]].map(&Array)
