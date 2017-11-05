class RoomsController < ApplicationController
  def answer
    @room = Room.find(params[:id])
    if @room.id == 1

if params[:user_prompt].downcase == "2426"
        if @room.items.find_by(name: "Cell Phone").status == false
          flash[:danger] = "Invalid entry."
          redirect_to "/rooms/#{ params[:room_id] }"
        elsif @room.items.find_by(name: "Cell Phone").status == true
          redirect_to "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
        end

      elsif params[:user_prompt].downcase == "check door"
        if @room.items.find_by(name: "Cell Phone").status == false
          flash[:warning] = "The door is locked, but has a keypad. A small piece of paper taped above the keypad reads 'ENTER 4 DIGIT PASSCODE'."
          redirect_to "/rooms/#{ params[:room_id] }"
        else @room.items.find_by(name: "Cell Phone").status == true
          flash[:warning] = "That cellphone text had the passcode to the door. Maybe I should check the cellphone, read the text, and enter the passcode provided."
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

      elsif params[:user_prompt].downcase == "check cellphone"
        if @room.items.find_by(name: "Cell Phone").status == true
          flash[:warning] = "Rereading the text, you see the passcode to the door - 2426."
          redirect_to "/rooms/#{ params[:room_id] }"
        elsif @room.items.find_by(name: "Desk").status == false
          flash[:danger] = "Invalid entry"
          redirect_to "/rooms/#{ params[:room_id] }"
        else @room.items.find_by(name: "Desk").status == true
          flash[:warning] = "After observing the cellphone, you find that it is locked by a 4 digit passcode. Try entering a 4 digit passcode to see if you can unlock it."
          redirect_to "/rooms/#{ params[:room_id] }"
        end

      elsif params[:user_prompt].downcase == "check desk"
        if @room.items.find_by(name: "Desk").status == true
          flash[:warning] = "There is nothing else of interest in the desk."
          redirect_to "/rooms/#{ params[:room_id] }"
        elsif @room.items.find_by(name: "Fisherman").status == false 
          flash[:danger] = "This desk has a drawerer, but it appears to be locked. It looks like there's a keyhole."
          redirect_to "/rooms/#{ params[:room_id] }"
        else @room.items.find_by(name: "Fisherman").status == true
          flash[:success] = "Using the key from the fisherman, you open the desk drawerer and grab a CELL PHONE."
          @room.items.find_by(name: "Desk").update_attributes(status: true)
          redirect_to "/rooms/#{ params[:room_id] }"
        end

      elsif params[:user_prompt].downcase == "check fisherman"
        if @room.items.find_by(name: "Fisherman").status == true
          flash[:warning] = "The fisherman has his pole, and the comparment that contained the key is empty. Nothing more to see here."
          redirect_to "/rooms/#{params[:id]}"
        elsif @room.items.find_by(name: "Box").status == false
          flash[:danger] = "This fisherman is missing his pole"
          redirect_to "/rooms/#{params[:id]}"
        else @room.items.find_by(name: "Box").status == true
          flash[:success] = "As soon as you place the fishing pole in his hand, a small comparment pops open - you recieved a key!"
          @room.items.find_by(name: "Fisherman").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        end

      elsif params[:user_prompt].downcase == "check box"
        if @room.items.find_by(name: "Potted Plant").status == false
          flash[:warning] = "The box is closed. You try to open it, but it won't budge. I have to figure out some way to open it."
          redirect_to "/rooms/#{params[:id]}"
        elsif @room.items.find_by(name: "Box").status == true
          flash[:warning] = "You find nothing else of interest in the box."
          redirect_to "/rooms/#{params[:id]}"
        else @room.items.find_by(name: "Potted Plant").status == true
          flash[:success] = "You open the box and find a small Fishing Pole. Why would anyone ever need a small fishing pole..?"
          redirect_to "/rooms/#{params[:id]}"
          @room.items.find_by(name: "Box").update_attributes(status: true)
        end

      elsif params[:user_prompt].downcase == "check shelf"
        flash[:success] = "You see a statuette of a FISHERMAN and a small BOX."
        redirect_to "/rooms/#{params[:id]}"

      elsif params[:user_prompt].downcase == "check cushions"
        flash[:success] = "Someone taped a piece of paper to the bottom of this cushion.. it says '1627'. I should make a note of that.."
        redirect_to "/rooms/#{params[:id]}"

      elsif params[:user_prompt].downcase == "check couch"
        flash[:warning] = "It looks like someone messed with one of the CUSHIONS."
        redirect_to "/rooms/#{params[:id]}"

      elsif params[:user_prompt].downcase == "check potted plant"
        if @room.items.find_by(name: "Potted Plant").status == true
          flash[:warning] = "This plant is watered. Nothing more is needed here."
          redirect_to "/rooms/#{params[:id]}"
        elsif @room.items.find_by(name: "Bottle of Water").status == true
          flash[:success] = "You use the Bottle of Water to water the plant. Did I hear a clicking sound coming from the shelf?"
          @room.items.find_by(name: "Potted Plant").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        else @room.items.find_by(name: "Bottle of Water").status == false
          flash[:warning] = "This plant looks dry. Maybe some water would help."
          redirect_to "/rooms/#{params[:id]}"
        end

      elsif params[:user_prompt].downcase == "check coffee table"
        if @room.items.find_by(name: "Bottle of Water").status == true
          flash[:warning] = "You find nothing else of interest on the coffee table."
          redirect_to "/rooms/#{params[:id]}"
        else
          flash[:success] = "You found a bottle of water!"
          @room.items.find_by(name: "Bottle of Water").update_attributes(status: true)
          redirect_to "/rooms/#{params[:id]}"
        end

      elsif params[:user_prompt].downcase == "help"
        flash[:suc] = "Welcome to check <escape>! There is only 1 command (aside from 'help') and that is 'check <OBJECT>'. Keep an eye out for CAPITALIZED objects in the room, and be sure to check them! For example, to check the door, the user would type 'check door'. The case (captial, lower, etc) of 'door' doesn't matter. It's only capitalized in game to show that it is checkable. Good luck!"
        redirect_to "/rooms/#{params[:id]}"



      else
        flash[:danger] = "Invalid entry"
        redirect_to "/rooms/#{ params[:room_id] }"
      end
      
    end
  end


  def show
    @room = Room.find(params[:id])
  end
end
