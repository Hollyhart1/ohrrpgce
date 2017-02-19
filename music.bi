#IFNDEF __MUSIC_BI__
#DEFINE __MUSIC_BI__

#INCLUDE "config.bi"
#INCLUDE "lumpfile.bi"

'' External music functions

ENUM MusicFormatEnum
	FORMAT_UNSPECIFIED = 0
	FORMAT_BAM = 1
	FORMAT_MIDI = 2
	FORMAT_MOD = 4
	FORMAT_OGG = 8
	FORMAT_MP3 = 16
	FORMAT_XM = 32
	FORMAT_IT = 64
	FORMAT_S3M = 128
	FORMAT_WAV = 256
END ENUM

'' FX=WAV or OGG only, Music=all but WAV and MP3
#define VALID_FX_FORMAT (FORMAT_WAV or FORMAT_OGG or FORMAT_MP3)
#define VALID_MUSIC_FORMAT (FORMAT_BAM or FORMAT_MIDI or FORMAT_MOD or FORMAT_OGG or FORMAT_MP3 or FORMAT_XM or FORMAT_IT or FORMAT_S3M)
'SDL_Mixer crashes on a lot of MP3s
#if not defined(MUSIC_SDL_BACKEND)
#define PREVIEWABLE_FX_FORMAT (FORMAT_WAV or FORMAT_OGG or FORMAT_MP3)
#define PREVIEWABLE_MUSIC_FORMAT (FORMAT_BAM or FORMAT_MIDI or FORMAT_MOD or FORMAT_OGG or FORMAT_MP3 or FORMAT_XM or FORMAT_IT or FORMAT_S3M)
#else
#define PREVIEWABLE_FX_FORMAT (FORMAT_WAV or FORMAT_OGG)
#define PREVIEWABLE_MUSIC_FORMAT (FORMAT_BAM or FORMAT_MIDI or FORMAT_MOD or FORMAT_OGG or FORMAT_XM or FORMAT_IT or FORMAT_S3M)
#endif

declare sub music_init()
declare sub music_close()

'Return runtime information. Called both before and after initialisation, should report as much as can be managed
'(eg. just return dll version)
declare function music_get_info() as string

'The fmt arg is not very useful, and mostly ignored.
declare sub music_play overload(songname as string, byval fmt as MusicFormatEnum = FORMAT_UNSPECIFIED)
declare sub music_play overload(byval lump as Lump ptr, byval fmt as MusicFormatEnum = FORMAT_UNSPECIFIED)
declare sub music_pause()
declare sub music_resume()
declare sub music_stop()

declare sub music_setvolume(byval vol as single)
declare function music_getvolume() as single


declare sub sound_init()
declare sub sound_close()
declare sub sound_reset()

' num_is_slot is NO if num is an OHR sound number, YES if it's a slot number (returned from sound_load)
' loopcount is N to play N+1 times, -1 to loop forever.
declare sub sound_play(num as integer, loopcount as integer, num_is_slot as bool = NO)
declare sub sound_pause(num as integer, num_is_slot as bool = NO)
declare sub sound_stop(num as integer, num_is_slot as bool = NO)

' Returns the first sound slot with the given sound effect ID (num);
' if the sound is not loaded, returns -1.
declare function sound_slot_with_id(num as integer) as integer

declare function sound_playing(num as integer, num_is_slot as bool = NO) as bool

' Normally sound_play is use to load and play a sound effect directly, but sound_load
' can be used to do this in two steps.
declare function sound_load overload(lump as Lump ptr, num as integer = -1) as integer
declare function sound_load overload(filename as string, num as integer = -1) as integer

' These are only used if sound_load was used explicitly, and differ in
' whether to unload a slot or a sound effect number.
declare sub sound_unload(slot as integer)
declare sub sound_free(num as integer)


'' Functions in bam2mid.bas

declare sub bam2mid(infile as string, outfile as string)


#ENDIF
