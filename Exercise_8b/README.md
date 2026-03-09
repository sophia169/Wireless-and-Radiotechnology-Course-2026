# RF Planning Studio – Short Analysis Task
### Increase Gateway Height by +5 m
Does maximum LOS distance change?
Yes, it increases slightly (about 2 km improvement).
Does link feasibility improve significantly?
No, the improvement is small.
Why?
Increasing antenna height mainly improves line-of-sight geometry and obstacle clearance, but it does not significantly change path loss in the propagation model used here.

### Increasing Antenna Gain to 5 dBi
How does the received power curve change?
The entire received power curve shifts upward by about 6 dB.
How much additional range is achieved?
The link can operate at longer distances before reaching receiver sensitivity.
Why does antenna gain extend coverage?
Higher antenna gain focuses the transmitted energy in a specific direction, increasing the effective radiated power and improving the received signal strength.

### Changing Environment Exponent (n)
How does increasing n affect coverage?
Increasing n increases path loss, causing received power to drop faster with distance, which reduces coverage range.
Which has stronger impact on range: gain increase or environment change?
The environment exponent (n) usually has a stronger impact.
Explain physically
The environment exponent represents obstacles, buildings, trees, and reflections.
A higher n means more signal absorption and scattering, which significantly reduces signal strength.

### Moving Gateway Location (Fresnel Study)
Where is the Fresnel radius largest?
The Fresnel radius is largest at the midpoint of the link.
Mathematically:
r_F=√((λx(D-x))/D)

Maximum occurs when:
x=D/2

Why is midpoint usually critical?
At the midpoint, the Fresnel zone radius is maximum, meaning obstacles there block more of the signal path.
What happens if the 60% clearance rule is violated?
If the obstacle blocks more than 40% of the Fresnel zone, it causes:

	- Diffraction loss
  
	- Signal attenuation
  
	- Reduced received power
  
	- Possible link failure

### A final conclusion
In practical wireless deployment, the environment exponent (n) has the strongest impact on coverage because it represents real-world propagation conditions such as buildings, vegetation, and terrain. These obstacles significantly increase path loss and reduce signal strength. Increasing antenna gain can improve coverage by boosting received power, but its effect is limited compared to environmental factors. Increasing antenna height mainly improves line-of-sight and obstacle clearance but does not greatly change path loss in simplified models. Proper Fresnel zone clearance, especially near the midpoint of the link, is also critical to avoid diffraction losses. Therefore, accurate environmental modeling and obstacle management are essential for reliable wireless link design.
