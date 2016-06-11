# Sadness
# Sonic Pi v2.10
#
# SoundCloud: https://soundcloud.com/kesara_nr/sc02-sadness
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
play_chord [:D, :F, :G], amp: 2.5
sleep 1
play_chord [:D, :F, :G], amp: 1.5
sleep 1
play_chord [:D, :F, :G], amp: 0.5
sleep 1
play_chord [:D, :F, :G], amp: 0.25
sleep 1

live_loop :pulser do
  with_fx :pan, amp: 0.5, pan: -1 do
    use_synth :pulse
    play 60, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5
    sleep 2
  end
  with_fx :pan, amp: 0.5, pan: 0 do
    use_synth :pulse
    play 60, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5
    sleep 2
  end
  with_fx :pan, amp: 0.5, pan: 1 do
    use_synth :pulse
    play 60, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5
    sleep 2
  end
  sleep 0.5
end

live_loop :beat do
  if one_in(2)
    with_fx :reverb, room: 1 do
      sample :drum_bass_hard, amp: 2, rate: 5
    end
  else
    with_fx :reverb, room: 1 do
      sample :drum_heavy_kick, amp: 3, rate: 5
    end
  end
  sleep 1
end

live_loop :synth do
  use_synth [:prophet, :dsaw, :tb303].choose
  if one_in(2)
    play 60, amp: 0.75, attack: 0.1, attack_level: 1, decay: 0.5, decay_level: 0.5, sustain_level: 0.4, sustain: 0.25, release: 0.5
  else
    play 58, amp: 0.75, attack: 0.2, attack_level: 1, decay: 0.5, decay_level: 0.5, sustain_level: 0.4, sustain: 0.25, release: 0.25
  end
  sleep 1
  use_synth [:blade, :fm, :dsaw].choose
  if one_in(3)
    play [65, 68].choose, amp: 0.75, sustain: 0.25
  else
    play [55, 58].choose, amp: 0.75, sustain: 0.5, decay: 0.5
  end
  sleep 1
end

live_loop :ambience do
  with_fx :echo, decay: 3, phase: [0.3, 0.6].choose do
    sample :ambi_choir, rate: [0.45, -0.45].choose
  end
  sleep 3
end
