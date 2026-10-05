# credits_public
- Public version of Frums - Credits animation repository.
- Should be multiplatform. Feel free to raise an issue if it isn't. Feel free to raise an issue for anything.
- Tested on clean Python 3.6 (Windows 10) with minimal modules installed.
 
 
# media credits
- All animation work done by me (plaaosert)
- Renderer used is an in-progress command line rendering library for which a separate repository will be created... eventually.
- Song credit: Frums - Credits EX https://soundcloud.com/frums/credits-ex
- Song is not included in this repository. Read /media/README.txt.

 
# how to see
- https://youtu.be/o3cKQzrtFgQ
 
 
# how to run
 Run `credits.py`. Required libraries:
 - just-playback https://github.com/cheofusi/just_playback
 - keyboard https://github.com/boppreh/keyboard
   - **important**: if you're running **linux** or **macos**, you might have trouble with this module. if so, try using `credits_pynput.py` instead (and install pynput -- https://pypi.org/project/pynput/)
 - colorama https://github.com/tartley/colorama -
 the version of colorama used is also included inside this repository.

 You can install all required libraries by running:
 ```
 pip install -r requirements.txt
 ```

# misc

## start-of-song skips
before the animation starts, a menu will appear with options to skip to specific parts of the song. i used this a lot while debugging and left it in because i ~forgot~ felt i should include it. input nothing to let the song start normally, else hold a digit key on the keyboard to skip:
- 1 | start _(equivalent to pressing no button but slightly faster)_
- 2 | title _(flashing square in center + artist and self credits)_ 
- 3 | funding _(start of first "Funding for this program was made possible..." section)_ 
- 4 | loading _(loading bar before fake error and second typography "searching for access point" segment)_
- 5 | break _(hell ocean, second weather forecast scene)_
- 6 | final _(return of the flashing square - ending sequence)_

## generic hotkeys
| hotkey              | effect                   |
| ------------------- | ------------------------ |
| `p`                 | play/pause toggle        |
| `,`                 | small fast forward (4x)  |
| `.`                 | medium fast forward (8x) |
| `/`                 | large fast forward (16x) |
