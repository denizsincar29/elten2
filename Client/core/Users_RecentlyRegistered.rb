#Elten Code
#Copyright (C) 2014-2016 Dawid Pieper
#All rights reserved.


#Open Public License is used to licensing this app!

class Scene_Users_RecentlyRegistered
  def initialize
        delay(0.25)
    @users = srvproc("recentlyregistered","name=#{$name}\&token=#{$token}")
            for i in 0..@users.size - 1
      @users[i].delete!("\r")
      @users[i].delete!("\n")
    end
        onl = []
    for i in 1..26
      onl.push(@users[i]) if @users[i]!=nil and @users[i].size > 0
    end
        selt = []
    for i in 0..onl.size - 1
      selt[i] = onl[i] + "." + " " + getstatus(onl[i])
      end
    @sel = Select.new(selt,true,0,"Ostatnio zarejestrowani użytkownicy",true)
    speech_stop
    @onl = onl
    end
    def main
                  @sel.focus
    loop do
loop_update
      @sel.update
      if escape
        $scene = Scene_Main.new
        break
      end
      if alt
                menu
                loop_update
              end
      if enter
                usermenu(@onl[@sel.index],false)
        end
      break if $scene != self
      end
    end
    def menu
play("menu_open")
play("menu_background")
@menu = menulr(sel = [@onl[@sel.index],"Odświerz","Anuluj"])
loop do
loop_update
@menu.update
break if $scene != self
if enter
  case @menu.index
  when 0
    if usermenu(@onl[@sel.index],true) != "ALT"
          @menu = menulr(sel)
        else
          break
        end
        when 1
          @main = true
  when 2
$scene = Scene_Main.new
end
break
end
if Input.trigger?(Input::DOWN) and @menu.index == 0
    Input.update
  if usermenu(@onl[@sel.index],true) != "ALT"
    @menu = menulr(sel)
  else
    break
    end
  end
if alt or escape
break
end
end
Audio.bgs_stop
play("menu_close")
delay(0.25)
if @main == true
  initialize
  main
  end
return
end
end
#Copyright (C) 2014-2016 Dawid Pieper