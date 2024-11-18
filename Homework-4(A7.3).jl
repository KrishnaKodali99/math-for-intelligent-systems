using WAV
using DSP

x, f = wavread("audio_filtering_original.wav");
x = vec(x);

wavplay(x, f);

h_smooth = ones(44)/44
output = conv(h_smooth, x)
wavplay(output, f)

k = 0.25f
h_echo = zeros(Int(k+1))
h_echo[1] = 1
h_echo[Int(k)+1] = 0.5

echo_output = conv(h_echo, x)
wavplay(echo_output, f)

output = conv(h_echo, echo_output)
wavplay(output, f)
