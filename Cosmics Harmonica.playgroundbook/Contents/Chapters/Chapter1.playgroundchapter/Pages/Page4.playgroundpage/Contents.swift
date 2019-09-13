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
 ## Creating art using science 🎨
 
I have something special for you, Press **Run My Code**!
 
Try using the science concepts you have just learnt to create a piece of art uniquely yours in the universe (both literally and figuratively).
 
 **Experiment with:**
1. Different colors for the lines,
2. Different orbital speed/radius,
3. Or even different combination of planets

You now can draw not only one, but up to three lines at the same time with different colours! 🖼

 - important:
 1. The default color of **firstLineColor** has been changed to pink color
 2. Run the code and you will get yourself a rose!
 3. Take a screenshot, send it to your loved ones ❤️

 Your creativity is the limit.
 ---
 
 - Note:
     - A tip: Try hooking up Moon with Earth and see what it could create! Moon is the natural satellite to Earth and unlike other planets that revolves around Sun, it revolves around the Earth. Just like how Phobos and Deimos are for Mars.
     - Experience it in Full Screen :)
 
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
drawingConfig.firstLineColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
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
//#-hidden-code
let viewController = ChapterOneViewController()
PlaygroundPage.current.liveView = viewController
//#-end-hidden-code

