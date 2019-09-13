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
 ## Geometrical Pattern in the Cosmos
 
 **Tap Run My Code**
 
 Watch the Earth-Venus dance for eight years and marvel at how the symmetrical pattern it generates creates this beautiful five-petal flower with the Sun being at the centre.
 
 The intrinsic geometrical patterns look very similar to those made in Cymatics, a wave vibration phenomenon. (which surely does deserve a standalone Playground for itself!)
 
 - Note:
 Use gesture to control the pattern to look at it from 360 degree.
 
 First, practise with the basics using only just planet Venus and Earth.
 
 **The formation of the geometrical pattern is largely due to**
 * Different orbital period around the Sun
 * Different orbital radius (distance from Sun)
  
 Using the refrence sheet provided below to simulate the actual pattern formed in the universe, And by getting the right ratio between planets’ orbital speed and radius, we could replicate the patterns that exist in the universe.

 We can control the number of orbits for the geometrical pattern formation, simply multiply your orbital duration with the number of the years and use that as the drawingDuration value. Remember, not all **years** are the same! Eight Earth years equals thirteen Venus years
 

 - Note:
 Orbital period of each planet around its Centre of Mass:
     - Mercury - 88 days
     - Venus - 225 days
     - Earth - 365 days
     - Mars - 687 days
     - Moon - 27 days
     - Phobos - 8 hours
     - Deimos - 30 hours
 */
planetsOrbitalPeriod.venus = 2.25
planetsOrbitalPeriod.earth = 3.65
/*:
 - Note:
 **To determine value for drawingDuration**
    1. First, decide how many orbits or years we want the final pattern to have
    2. The value of **drawingDuration** will then be **orbital-period** of the planet multiply with the **number-of-year**

 ```
 Calculation for drawingDuration in our case
 = 8 years * 365 days
 = 8 years * 3.65 (our orbital period for earth)
 = 29.2
 ```
 
 */
drawingConfig.drawingDuration = TimeInterval(29.2)
/*:
 - Note:
 Orbital radius of each planet:
     - Sun - 695,700 km
     - Mercury - 2,440 km
     - Venus - 6,052 km
     - Earth - 6,371 km
     - Mars - 3,390 km
     - Moon - 1,737 km
     - Phobos - 11 km
     - Deimos - 6 km
 */
planetsOrbitalRadius.venus = 8
planetsOrbitalRadius.earth = 13
/*:
 [Now we know the basics, head over to the Challenge!](@next)
*/
//#-hidden-code
let viewController = ChapterOneViewController()
PlaygroundPage.current.liveView = viewController
//#-end-hidden-code
