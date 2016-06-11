# Randomness
# Sonic Pi v2.10
#
# SoundCloud: https://soundcloud.com/kesara_nr/sc03-randomness
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
live_loop :ambience do
  use_synth :dark_ambience
  play_chord [:F, :A, :C], sustain: 1.5, attack: 0.25, release: 0.25
  sleep(1)
  play_chord [:E, :Gs, :B], sustain: 1.5, attack: 0.25, release: 0.25
  sleep(1)
  play_chord [:G, :B, :D], sustain: 1.5, attack: 0.25, release: 0.25
  sleep(1)
  play_chord [:F, :A, :C], sustain: 1.5, attack: 0.25, release: 0.25
  sleep(1)
end

live_loop :beat do
  with_fx :reverb, room: rrand(0.1, 1) do
    with_fx :echo, mix: rrand(0, 0.1), decay: rrand(0, 4) do
      sample :drum_tom_hi_soft, amp: 0.75, rate: 0.5
      sample :drum_tom_lo_soft, amp: 0.55, rate: [-0.25, 0.25].choose
      sleep (1)
    end
  end
end

live_loop :ambience_drums do
  with_fx :reverb, room: rrand(0.5, 1), mix: rrand(0, 1) do
    sample :ambi_choir, rate: 0.25, amp: rrand(0, 0.5)
    sample :loop_tabla, amp: rrand(0.1, 0.4)
    if one_in(10)
      with_fx :gverb, room: rrand(10, 15) do
        sample :loop_safari, amp: rrand(0.1, 0.2), attack: 0.25, release: 0.25
      end
    end
  end
  sleep 1
end

live_loop :noice do
  s = rrand(0, 0.5)
  sus = rrand(0, 0.25)
  a = rrand(0, 0.1)
  use_synth [:dsaw, :prophet].choose
  play [:F, :A, :C].choose, sustain: sus, attack: 0.25, release: 0.25, amp: a
  sleep(s)
  play [:E, :Gs, :B].choose, sustain: sus, attack: 0.25, release: 0.25, amp: a
  sleep(s)
  play [:G, :B, :D].choose, sustain: sus, attack: 0.25, release: 0.25, amp: a
  sleep(s)
  play [:F, :A, :C].choose, sustain: sus, attack: 0.25, release: 0.25, amp: a
  sleep(s)
end
