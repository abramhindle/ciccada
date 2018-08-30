Phasor phs => Gen9 gbuzz => Gain g => Gain g2 => HPF h => dac;
PulseOsc p => g;
SinOsc s => g2;
Math.random2f(1000.0,6000.0) => h.freq;
Math.random2f(0.3,0.9) => h.Q;
Math.random2f(2,10) => s.freq;
30 => int partials;
0 => int index;
float coefs[partials*3];
Math.random2f(190,210) => phs.freq;
Math.random2f(0.1,0.9) => p.width;
1.0/Math.random2f(0.01,0.06) => p.freq;

while (index < partials) {
    1.0+index $float =>    coefs[index*3 + 0];       
    1.0              =>    coefs[index*3 + 1];
    (index$float) / (partials$float) => coefs[index*3 + 1];
    90.0             =>    coefs[index*3 + 2];
    index++;
}

coefs => gbuzz.coefs;

Math.random2f(1.0,20.0) * second => now;
