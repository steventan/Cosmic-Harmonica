//#-hidden-code
//
//  Contents.swift
//
//  Created by Steven Tan on 23/3/19.
//
// Second page
import UIKit
import PlaygroundSupport
//#-end-hidden-code
/*:
 ## Creating our own Harmonic 🎼
 
 Press **Run My Code** to see an animated example of fifth harmonic.

 Same combination of two planets, but if with different orbital speed and radius will result in different patterns.
 
 **Experiment with:**
 1. Increasing one of the two factors, for example the **relative orbital speed of Earth** from 2 to 3, and then 3 to 4 (while keeping other values the same)
 2. We would gradually notice a Harmonic pattern series.
 3. After that, play around with both orbital speed and radius

You now can create your own unique harmonics using the science concepts you have just learned!
 
 - Note:
 The cover image of this Playground (the star) was created with Venus and Earth and it was at the Fifth Harmonic ☺️ 
 
 **Enjoy the music at the concert of the universe** 🎹
 */
systemConfig.setupMercury = false
systemConfig.setupVenus = true
systemConfig.setupEarth = true
systemConfig.setupMars = false
systemConfig.setupMoon = false
systemConfig.setupPhobos = false
systemConfig.setupDeimos = false
/*:
 - Note:
    - **drawingFrequency** is how frequent to draw a line between two planets, in seconds.
    - The value of **drawingDuration** will then be **orbital-period** of the planet multiply with the **number-of-year**
 */
drawingConfig.drawingFrequency = TimeInterval(0.01)
drawingConfig.drawingDuration = TimeInterval(29.2)
/*:
 - Note:
    - Drawing lines with new color between planets.
    - But remember to also set up those planets!
 
 ```
 To set up planet Moon as one of the planets:
 
 systemConfig.setupMoon = true
 
 drawingExtraLineConfig.drawSecondLine = true
 drawingExtraLineConfig.secondLinePlanetA = moonNode
 ```
 */
drawingConfig.drawFirstLine = true
drawingConfig.firstLinePlanetA = earthNode
drawingConfig.firstLinePlanetB = venusNode
drawingConfig.firstLineColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
/*:
 >Drawing the second line.
 */
drawingExtraLineConfig.drawSecondLine = false
drawingExtraLineConfig.secondLinePlanetA = earthNode
drawingExtraLineConfig.secondLinePlanetB = deimosNode
drawingExtraLineConfig.secondLineColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
/*:
 >Drawing the third line.
 */
drawingExtraLineConfig.drawThirdLine = false
drawingExtraLineConfig.thirdLinePlanetA = earthNode
drawingExtraLineConfig.thirdLinePlanetB = moonNode
drawingExtraLineConfig.thirdLineColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
/*:
 >Remove the orbits and the planets at the end.
 */
systemConfig.removePlanets = true
systemConfig.removeOrbits = true
/*:
 >Setting the planets' orbital period, in unit seconds.
 
 - important:
    - All of the orbital Period pre-set below is calculated based on the ratio
    - Hence the moon is only 0.30 seconds, which is relatively fast in our simulated environment
 - But the value is keep true at 0.30 to ensure its accuracy, feel free to change it :)
 
 */
planetsOrbitalPeriod.mercury = 0.88
planetsOrbitalPeriod.venus = 2.25
planetsOrbitalPeriod.earth = 3.65
planetsOrbitalPeriod.mars = 6.87
planetsOrbitalPeriod.moon = 0.30
planetsOrbitalPeriod.phobos = 0.83
planetsOrbitalPeriod.deimos = 1.3
/*:
 >Setting the planets' orbital radius, in relative scale.
 */
planetsOrbitalRadius.mercury = 2
planetsOrbitalRadius.venus = 8
planetsOrbitalRadius.earth = 13
planetsOrbitalRadius.mars = 17
planetsOrbitalRadius.moon = 6
planetsOrbitalRadius.phobos = 6
planetsOrbitalRadius.deimos = 6
/*:
 - Note:
    - Harmonic intervals are geometric progressions in sound that point to an intentional repetition of form.
    - The discovery that these formal repetitions are found in relationships between planets, musical notes, geometry and mathematics.
*/
//#-hidden-code
let viewController = ChapterOneViewController()
PlaygroundPage.current.liveView = viewController
//#-end-hidden-code
