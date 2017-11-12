class RoomsController < ApplicationController

def index
  @room = Room.find_by(params[:id])
end

  def answer
    @room = Room.find(params[:id])
    

if params[:user_prompt].downcase == "2426"
        if @room.items.find_by(name: "Cell Phone").status == false
          flash[:danger] = "Invalid entry."
          redirect_to "/rooms/#{ params[:room_id] }"
        elsif @room.items.find_by(name: "Cell Phone").status == true
          redirect_to "/escape "
        end

      elsif params[:user_prompt].downcase == "door"
        if @room.items.find_by(name: "Cell Phone").status == false
          flash[:warning] = "The door is locked, but has a keypad. A small piece of paper taped above the keypad reads 'ENTER 4 DIGIT PASSCODE'."
          redirect_to "/rooms/#{ params[:room_id] }"
        else @room.items.find_by(name: "Cell Phone").status == true
          flash[:warning] = "That cell phone text had the passcode to the door. Maybe I should check the cell phone, read the text, and enter the passcode provided."
          redirect_to "/rooms/#{ params[:room_id] }"
        end

      elsif params[:user_prompt] == "1627"
        if @room.items.find_by(name: "Desk").status == false
          flash[:danger] = "Invalid entry."
          redirect_to "/rooms/#{ params[:room_id] }"
        else @room.items.find_by(name: "Desk").status == true
          flash[:success] = "You successfully unlock the cellphone and find a text from someone named 'Property Owner'. The text says:'don't forget the door password - it's 2426! We had a guy get stuck in there for days.'"
          @room.items.find_by(name: "Cell Phone").update_attributes(status: true)
          redirect_to "/rooms/#{ params[:room_id] }"
        end

      elsif params[:user_prompt].downcase == "cell phone"
        if @room.items.find_by(name: "Cell Phone").status == true
          flash[:warning] = "Rereading the text, you see the passcode to the door - 2426."
          redirect_to "/rooms/#{ params[:room_id] }"
        elsif @room.items.find_by(name: "Desk").status == false
          flash[:danger] = "Invalid entry"
          redirect_to "/rooms/#{ params[:room_id] }"
        else @room.items.find_by(name: "Desk").status == true
          flash[:warning] = "You grab the cell phone from the desk. You find that it is locked by a 4 digit passcode. Try entering a 4 digit passcode to see if you can unlock it."
          redirect_to "/rooms/#{ params[:room_id] }"
        end

      elsif params[:user_prompt].downcase == "desk"
        if @room.items.find_by(name: "Desk").status == true
          flash[:warning] = "There is nothing else of interest in the desk."
          redirect_to "/rooms/#{ params[:room_id] }"
        elsif @room.items.find_by(name: "Fisherman").status == false 
          flash[:warning] = "This desk has a drawerer, but it appears to be locked. It looks like there's a keyhole."
          redirect_to "/rooms/#{ params[:room_id] }"
        else @room.items.find_by(name: "Fisherman").status == true
          flash[:success] = "Using the key from the fisherman, you open the desk drawerer and find a CELL PHONE."
          @room.items.find_by(name: "Desk").update_attributes(status: true)
          redirect_to "/rooms/#{ params[:room_id] }"
        end

      elsif params[:user_prompt].downcase == "key"
        if @room.items.find_by(name: "Fisherman").status == true
          flash[:success] = "You aquire a small brass key. Looks like it belongs to something quite old."
          @room.items.find_by(name: "Key").update_attributes(status: true)
          redirect_to "/rooms/#{ params[:room_id] }"
        else
          flash[:danger] = "Invalid command."
          redirect_to "/rooms/#{ params[:room_id] }"
        end

      elsif params[:user_prompt].downcase == "fisherman"
        if @room.items.find_by(name: "Fisherman").status == true
          flash[:warning] = "The fisherman has his pole, and the comparment that contained the key is empty. Nothing more to see here."
          redirect_to "/rooms/#{params[:id]}"
        elsif @room.items.find_by(name: "Box").status == false
          flash[:warning] = "A small statuette of a fisherman. He looks like he's missing something.."
          redirect_to "/rooms/#{params[:id]}"
        else @room.items.find_by(name: "Box").status == true
          flash[:success] = "As soon as you place the fishing pole in his hand, a small comparment pops open - you see a KEY."
          @room.items.find_by(name: "Fisherman").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        end

      # elsif params[:user_prompt].downcase == "fishing pole"
      #   if @room.items.find_by(name: "Box").status == true
      #     flash[:warning] = "It looks like someone just took a coffee stirer and tied a string to it. Fishing pole is probably a generous description - but for the sake of this puzzle we're going to assume that's what it is."
      #     redirect_to "/rooms/#{params[:id]}"
      #   else
      #     flash[:danger] = "Invalid command."
      #     redirect_to "/rooms/#{params[:id]}"
      #   end

      elsif params[:user_prompt].downcase == "fishing pole"
        if @room.items.find_by(name: "Fishing Pole").status == true
          flash[:warning] = "A small delicate fishing pole."
          redirect_to "/rooms/#{params[:id]}"
        elsif @room.items.find_by(name: "Box").status == true
          flash[:success] = "You gently remove the fishing pole from the box."
          @room.items.find_by(name: "Fishing Pole").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        else
          flash[:danger] = "Invalid entry."
          redirect_to "/rooms/#{params[:id]}"
        end

      elsif params[:user_prompt].downcase == "box"
        if @room.items.find_by(name: "Potted Plant").status == false
          flash[:warning] = "The box is closed. You try to open it, but it won't budge. I have to figure out some way to open it."
          redirect_to "/rooms/#{params[:id]}"
        elsif @room.items.find_by(name: "Box").status == true
          flash[:warning] = "You find nothing else of interest in the box."
          redirect_to "/rooms/#{params[:id]}"
        else @room.items.find_by(name: "Potted Plant").status == true
          flash[:success] = "You open the box and find a small FISHING POLE. Why would anyone ever need a small fishing pole..?"
          redirect_to "/rooms/#{params[:id]}"
          @room.items.find_by(name: "Box").update_attributes(status: true)
        end

      elsif params[:user_prompt].downcase == "shelf"
        flash[:success] = "You see a statuette of a FISHERMAN and a small BOX."
        redirect_to "/rooms/#{params[:id]}"

      elsif params[:user_prompt].downcase == "cushions"
        flash[:success] = "Someone taped a piece of paper to the bottom of this cushion.. it says '1627'. I should make a note of that.."
        redirect_to "/rooms/#{params[:id]}"

      elsif params[:user_prompt].downcase == "couch"
        flash[:warning] = "It looks like someone messed with one of the CUSHIONS."
        redirect_to "/rooms/#{params[:id]}"

      elsif params[:user_prompt].downcase == "potted plant"
        if @room.items.find_by(name: "Potted Plant").status == true
          flash[:warning] = "This plant is watered. Nothing more is needed here."
          redirect_to "/rooms/#{params[:id]}"
        elsif @room.items.find_by(name: "Bottle of Water").status == true
          flash[:success] = "You use the Bottle of Water to water the plant. You hear a clicking sound coming from the SHELF!"
          @room.items.find_by(name: "Potted Plant").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        else @room.items.find_by(name: "Bottle of Water").status == false
          flash[:warning] = "This plant looks dry. Maybe some water would help."
          redirect_to "/rooms/#{params[:id]}"
        end

      elsif params[:user_prompt].downcase == "bottle of water"
        if @room.items.find_by(name: "Bottle of Water").status == true
          flash[:warning] = "It's Fiji. I would never pay $3 for a bottle of water but whatever."
          redirect_to "/rooms/#{params[:id]}"
        else @room.items.find_by(name: "Bottle of Water").status == false
          flash[:success] = "You aquire a bottle of water!"
          @room.items.find_by(name: "Bottle of Water").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        end

      elsif params[:user_prompt].downcase == "coffee table"
        if @room.items.find_by(name: "Coffee Table").status == true
          flash[:warning] = "You find nothing else of interest on the coffee table."
          redirect_to "/rooms/#{params[:id]}"
        else
          flash[:success] = "You see a lone BOTTLE OF WATER sitting on the coffee table."
          @room.items.find_by(name: "Coffee Table").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        end

      elsif params[:user_prompt].downcase == "help"
        flash[:suc] = "Look for objects in the room, identified by capital letters, and check them out by entering their name into the text field. For example, if you see a DOOR, type 'door' to observe and interact with it.

        If asked to enter a code, just enter the numbers; don't worry about typing the name of the object."
        redirect_to "/rooms/#{params[:id]}"

      elsif params[:user_prompt].downcase == "self"
        flash[:warning] = "You haven't washed your jeans in a while but everyone does that so it's fine."
        redirect_to "/rooms/#{ params[:room_id] }"

      elsif params[:user_prompt].downcase == "keyhole"
        flash[:warning] = "A rusty keyhole. This desk is definitely an antique."
        redirect_to "/rooms/#{ params[:room_id] }"

      elsif params[:user_prompt].downcase == "keypad"
        flash[:warning] = "It looks like some of the numbers are more worn in than others, but not enough to point me in the right direction."
        redirect_to "/rooms/#{ params[:room_id] }"

      elsif params[:user_prompt].downcase == "snek"
        redirect_to "/snek"

      else
        flash[:danger] = "Invalid entry"
        redirect_to "/rooms/#{ params[:room_id] }"
      end
      

  end

  def update_status
    @room = Room.find(params[:id])
    @room.items.each do |item|
      item.update_attributes(status: false)
    end
    redirect_to "/rooms/#{@room.id}"
  end

  def escape
    @room = current_user.rooms.find_by(params[:id])
    if @room.percentage_complete < 100
      redirect_to "/rooms/#{@room.id}"
    end
  end


  def show
    @room = Room.find(params[:id])
  end
end
