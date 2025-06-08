draw_sprite(s_selectionParticleOuter, 0, x, y);

for (var i = 0, n = array_length(particles); i < n; i++){
	var _particle = particles[i];
	draw_sprite(s_selectionParticleOuter, _particle.index, _particle.displayX, _particle.displayY);
}

draw_sprite(s_selectionParticleInner, 0, x, y);

for (var i = 0, n = array_length(particles); i < n; i++){
	var _particle = particles[i];
	draw_sprite(s_selectionParticleInner, _particle.index, _particle.displayX, _particle.displayY);
}