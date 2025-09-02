Hey there if you found this, congrats! I really have no idea what search engine gods (or devils) gave you this recommendation. This is a [DCSS (Dungeon Crawl Stone Soup)](https://crawl.develz.org/) custom Sound Pack I use for when playing. It mostly is meant to be humorous rather than serious. If you also want to check it out and use it please use [Sound Supprt for DCSS's Githug](https://github.com/refracta/dcss-webtiles-extension-module/tree/main/modules/sound-support#rc-example). You will need a server that allows sound and to run greasemonkey or some other kind of browser plugin if you are using the webtiles version. This also can be used with the offline, but you need to download the zip using the latest version and add the following to your init.txt (RC file). 

If you want to find me while playing, I play on the [New York DCSS Server](https://crawl.dcss.io/#lobby) and sometimes stream DCSS on [twitch](https://www.twitch.tv/msnecro/), but rarely as of late. If you are having issues or want to reach out you can find me on discord user name: msnecromancer

```
######################################################
###                 SOUND SETTINGS                 ###
######################################################
# https://github.com/refracta/dcss-webtiles-extension-module/tree/main/modules/sound-support#rc-example

sound_on = true
sound_debug = true
sound_volume = 0.4
one_SDL_sound_channel = false
     ## To work: one_SDL_sound_channel = true
    sound_fade_time = 0.5

     ## Pack that are listed last override the ones prior when duplicate.
     ## These are just suggested sound packs see the Sound-Support github for more info
sound_pack += https://osp.nemelex.cards/build/latest.zip:["init.txt"]
sound_pack += https://sound-packs.nemelex.cards/Autofire/BindTheEarth/BindTheEarth.zip

     ## My personal sound choices, silly and humorus mostly see 
     ## https://github.com/MsNecromancer/se/tree/main for more details
sound_pack += https://MsNecromancer.github.io/se/DCSSv.02.zip
######################################################
```
My sound pack currently only has the following

- The Shane Mcmahon WWE: Gozag welcomes you!



