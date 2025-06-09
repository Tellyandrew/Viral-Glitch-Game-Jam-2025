/// Platform
#macro OS_IS_BROWSER (os_type == os_gxgames or os_browser != browser_not_a_browser)
#macro OS_IS_GXGAMES (os_type == os_gxgames)

/// Fonts
global.MONOHEAD_MAPSTRING = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~▂";
global.OCCULANT_MAPSTRING = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~¡ª«º»¿ÀÁÂÃÄÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜßàáâãäæçèéêëìíîïñòóôõöùúûüÿŒœŸЁАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяёẞ‒–—‘’‚“”„…‹›№−▂⟨⟩";

global.FONT_MONOHEAD = font_add_sprite_ext(s_fontMonohead, global.MONOHEAD_MAPSTRING, false, 0);
global.FONT_OCCULANT = font_add_sprite_ext(s_fontOcculant, global.OCCULANT_MAPSTRING, true, 1);
draw_set_font(global.FONT_OCCULANT);

#macro SPECIAL_CHAR_BLOCK_DELETE chr(0x7F)
#macro SPECIAL_CHAR_INPUT_PADDING chr(0xF0000)

/// Game
global.POSSIBLE_PORTS = [
	[0, 1],
	[0, 2],
	[0, 3],
	[1, 2],
	[1, 3],
	[2, 3],
];

function array_choose(_array, _arrayLength = array_length(_array)){
	return _array[irandom(_arrayLength - 1)];
}