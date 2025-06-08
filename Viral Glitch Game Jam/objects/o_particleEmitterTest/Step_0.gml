frame++;

for (var i = array_length(particles) - 1; i >= 0; i--){
	var _particle = particles[i];
	
	if random(1) < 0.4{
		_particle.index++;
		if _particle.index >= PARTICLE_DEATH_INDEX{
			array_delete(particles, i, 1);
			continue;
		}
	}
	
	_particle.y--;
	_particle.x += random_range(-1, 1);
	_particle.displayX = round(_particle.x);
	_particle.displayY = round(_particle.y);
}

if frame % 2 == 0{
	array_push(particles, {
		x : x,
		y : y,
		displayX : x,
		displayY : y,
		index : irandom_range(1, 3),
	});
}