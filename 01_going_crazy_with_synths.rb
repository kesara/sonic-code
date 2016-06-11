# Going crazy with Synths
# Sonic Pi v2.10
#
# SoundCloud: https://soundcloud.com/kesara_nr/sc01-going-crazy-with-synths
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

live_loop :guitar_pan do
  with_fx :pan, amp: 0.4, pan: -1 do
    with_fx :echo, mix: 1, phase: 0.25 do
      sample :guit_em9, rate: 0.5
    end
  end
  sleep 3
  with_fx :pan, amp: 0.5, pan: 0 do
    with_fx :echo, mix: 1, phase: 0.25 do
      sample :guit_em9, rate: 0.5
    end
  end
  sleep 3
  with_fx :pan, amp: 0.4, pan: 1 do
    with_fx :echo, mix: 1, phase: 0.25 do
      sample :guit_em9, rate: 0.5
    end
  end
  sleep 3
end

live_loop :boom do
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 10, rate: 1
  end
  sleep 9
end

live_loop :crazy_bit do
  if one_in(2)
    with_fx :bitcrusher, mix: 0.5, pre_amp: 0.2 do
      sample :guit_e_slide, rate: 0.75
    end
  end
  if one_in(3)
    with_fx :bitcrusher, mix: 0.25, pre_amp: 0.1 do
      sample :guit_e_slide, rate: -0.25
    end
  end
  sleep 6
end

live_loop :synth_loop do
  use_synth :prophet
  play 57, amp: 0.5
  sleep 0.5
  if one_in(2)
    play 50, amp: 0.5
    sleep 0.25
  end
  if one_in(3)
    play 56, amp: 0.5
    sleep 0.25
  end
  
  use_synth :blade
  play 47, amp: 0.75
  sleep 0.25
  if one_in(2)
    play 40, amp: 0.75
    sleep 0.25
  end
  if one_in(3)
    play 45, amp: 0.75
    sleep 0.25
  end
  
  use_synth :prophet
  play 77, amp: 0.25
  sleep 0.25
  if one_in(2)
    play 70, amp: 0.25
    sleep 0.25
  end
  if one_in(2)
    play 76, amp: 0.25
    sleep 0.25
  end
  
  use_synth :zawa
  play 47, amp: 0.15
  sleep 0.25
  if one_in(2)
    play 40, amp: 0.15
    sleep 0.5
  end
  if one_in(3)
    play 46, amp: 0.15
    sleep 0.5
  end
  
  use_synth :blade
  play 57, amp: 0.25
  sleep 0.25
  if one_in(2)
    play 50, amp: 0.25
    sleep 0.5
  end
  if one_in(2)
    play 55, amp: 0.25
    sleep 0.5
  end
end
