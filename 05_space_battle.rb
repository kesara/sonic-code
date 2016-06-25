# Space Battle
# Sonic Pi v2.10
#
# SoundCloud: https://soundcloud.com/kesara_nr/sc05-space-battle
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

use_synth :tb303
[0.1, 0.25, 0.5, 0.75, 1].each do | a |
  sample :ambi_lunar_land
  play_chord chord(:e, :minor), amp: a
  sleep 1
end

chords = [:c3, :e, :e3, :a, :d]

live_loop :lightsabers do
  use_synth :tb303
  play_chord chord(chords.choose, :minor), release: rrand(0.1, 0.5), cutoff: rrand(100, 120)
  sleep 0.15
end

live_loop :landings do
  sample :ambi_lunar_land, amp: 5, pan: rrand(-1, 1)
  sleep rrand_i(10, 15)
end

live_loop :pass_by do
  sample :ambi_swoosh, sustain: 3, decay: 2, amp: 10, pan: rrand(-1, 1)
  sleep rrand_i(3, 10)
end
