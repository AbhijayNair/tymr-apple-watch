# Tymr for Apple Watch
Tymr is a standalone watchOS application that helps you save time you spend at the gym working out by tracking your rest intervals. I also threw in a Pomodoro productivity timer for fun.

I used to spend about two hours on an evereage in the gym and probably after the first 45 minutes, I could already start feeling the burnout. I knew what I was missing, a timer within the default workout app that helped me track my rest intervals between sets. Once you are done with a set, you can select either the short or the long break based on the exercise you just performed and the app will give you a sensory cue when the interval is done so that you can get back to your workout instead of scrolling away on social media.

## Stack
1. HealthKit - To start/ stop the workout, get heart rate and calories burned throughout the workout
2. SwiftUI - for basic UI elements
3. WatchKit - for the NowPlaying View within the workout timer

## How to run
1. Clone this repository on your system
   `git clone https://github.com/AbhijayNair/tymr-apple-watch.git`
2. Build the project on XCode, select your watch target and run

## To-do Features
1. Need an app logo, the default logo is dis..., not something I like to look at
2. Add customizable timer limits, the current break and active intervals are hard-coded
3. Maybe add a summary page at the end of the workout with the stats, currently everything is written back to the Health app on the phone.
