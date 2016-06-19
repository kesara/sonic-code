# Ambient Robots
# Sonic Pi v2.10
#
# SoundCloud: https://soundcloud.com/kesara_nr/sc04-ambient-robots
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

define :robot_play do |note, delta, repeats|
  repeats.times do
    play note, release: 0.1, cutoff: rrand(60, 120)
    sleep delta
  end
end

live_loop :robots do
  note = rand_i(45..55)
  delta = 0.125
  repeats = rand_i(100..150)
  use_synth [:prophet, :dsaw, :blade, :pulse].choose
  robot_play note, delta, repeats
end

live_loop :beats do
  rate = rrand(0.4, 0.6)
  sample :tabla_dhec, rate: rate
  if one_in(2)
    sample :tabla_ghe7, rate: rate
  else
    sample :tabla_ghe1, rate: rate
  end
  sleep 1
end

live_loop :ambience do
  sample :ambi_choir, rate: 0.5, amp: 0.8
  sleep 0.5
end

live_loop :haunted_hum do
  if one_in(2)
    sample :ambi_haunted_hum
  end
  sleep 5
end

