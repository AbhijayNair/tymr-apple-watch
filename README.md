# Tymr for Apple Watch

Tymr is a standalone watchOS application that helps you save time you spend at the gym working out by tracking your rest intervals. I also threw in a Pomodoro productivity timer for fun.

I used to spend about two hours on an evereage in the gym and probably after the first 45 minutes, I could already start feeling the burnout. I knew what I was missing, a timer within the default workout app that helped me track my rest intervals between sets. Once you are done with a set, you can select either the short or the long break based on the exercise you just performed and the app will give you a sensory cue when the interval is done so that you can get back to your workout instead of scrolling away on social media.

## Screenshots

<img src="https://github.com/user-attachments/assets/bfa188fd-44a5-4c61-a87d-d6885332a252" width="200" height="250"/>
<img src="https://github.com/user-attachments/assets/dde71df6-6065-4d41-91f1-b51330f1fa49" width="200" height="250"/>
<img src="https://github.com/user-attachments/assets/3720711e-5d3b-433a-bd5a-670fe5c6db30" width="200" height="250"/>
<img src="https://github.com/user-attachments/assets/f7345349-665d-4de3-87e0-3fc24d69ca1a" width="200" height="250"/>

## Stack
1. **HealthKit** - To start/ stop the workout, get heart rate and calories burned throughout the workout
2. **SwiftUI** - for basic UI elements
3. **WatchKit** - for the NowPlaying View within the workout timer

## How to run
1. Clone this repository on your system
   `git clone https://github.com/AbhijayNair/tymr-apple-watch.git`
3. Build the project on XCode, select your watch target and run

## To-do Features
1. Need an app logo.
2. Add customizable timer limits, the current break and active intervals are hard-coded.
3. Maybe add a summary page at the end of the workout with the stats, currently everything is written back to the Health app on the phone.

## License
Copyright 2024 Abhijay Nair

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
