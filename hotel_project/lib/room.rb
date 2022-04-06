class Room
  def initialize(capacity)
    @capacity= capacity
    @occupants = []
  end
  def capacity
    return @capacity
  end
  def occupants
    return @occupants
  end
  def full?
        if @occupants.length < @capacity
            return false
        end
    return true
    end
    
    def available_space
       additional = @capacity - @occupants.length
       return additional
    end

    def add_occupant(name)
        if self.full?
            return false
        end
        @occupants << name
        return true
    end


end