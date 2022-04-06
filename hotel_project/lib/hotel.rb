require_relative "room"
require "byebug"
class Hotel
  def initialize(name, hash)

    @name = name
    @rooms = {}
    hash.each do |room_name,capacity|
        @rooms[room_name] = Room.new(capacity)
         
    end
  end
# debugger
  def name 
   array_name = @name.split(" ")
    array_name.each_with_index do |names, i|
        array_name[i] = names.capitalize!
    end
   return array_name.join(" ")
  end

  def rooms
    return @rooms
  end
  def room_exists?(room_name)
    if @rooms.include?(room_name)
        return true
    end
    return false
    end 
    def check_in(person, room_name)
        if room_exists?(room_name)
            if Room.new(capacity).add_occupant(person) == true
            p 'check in successful'
            elsif Room.new(capacity).add_occupant(person) == false 
                p 'sorry, room is full'
            end
        end
    p 'sorry, room does not exist'

    end
    def has_vacancy?
        if Room.add_occupant(person) == false
            return false
        else
            return true
        end
    end
    # def list_rooms
    #     p hash
    # end
   

end
