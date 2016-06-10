# Starting up Ambient Engine with Sonic Pi v2.10
#
# SoundCloud: https://soundcloud.com/kesara_nr/sc00-ambient-engine
#
#                                       ╘
#                                ─       ╛▒╛
#                                 ▐╫       ▄█├
#                          ─╟╛      █▄      ╪▓▀
#                ╓┤┤┤┤┤┤┤┤┤  ╩▌      ██      ▀▓▌
#                 ▐▒   ╬▒     ╟▓╘    ─▓█      ▓▓├
#                 ▒╫   ▒╪      ▓█     ▓▓─     ▓▓▄
#                ╒▒─  │▒       ▓█     ▓▓     ─▓▓─
#                ╬▒   ▄▒ ╒    ╪▓═    ╬▓╬     ▌▓▄
#                ╥╒   ╦╥     ╕█╒    ╙▓▐     ▄▓╫
#                           ▐╩     ▒▒      ▀▀
#                                ╒╪      ▐▄
#

live_loop :beat do
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 10, rate: 1
    sample :bd_klub, amp: 10, rate: 1
    sample :bd_boom, amp: 10, rate: -1
  end
  sleep 1
end

live_loop :ambient do
  sample :ambi_choir, rate: 0.5
  
  if one_in(5)
    with_fx :reverb, room: 0.5 do
      sample :ambi_lunar_land, rate: 0.20
    end
  end
  
  if one_in(2)
    sample :bd_gas, rate: 0.5
  end
  
  sleep 1
end
