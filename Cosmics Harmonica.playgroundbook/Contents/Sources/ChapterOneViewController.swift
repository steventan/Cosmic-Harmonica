//
//  ChapterOneViewController.swift
//  Book_Sources
//
//  Created by Steven Tan on 23/3/19.
//

import UIKit
import Foundation
import PlaygroundSupport
import SceneKit

public var planetsOrbitalPeriod = PlanetsOrbitalPeriod()
public var planetsOrbitalRadius = PlanetsOrbitalRadius()
public var systemConfig = SolarSystemConfig()
public var drawingConfig = DrawingConfig()
public var drawingExtraLineConfig = DrawingExtraLineConfig()

public var mercuryNode = MercuryNode()
public var venusNode = VenusNode()
public var earthNode = EarthNode()
public var moonNode = MoonNode()
public var marsNode = VenusNode()
public var phobosNode = PhobosNode()
public var deimosNode = DeimosNode()



@available(iOS 11.0, *)
public class ChapterOneViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    // Creation of a helper node
    // as the Centre of Rotation around Sun
    lazy var mercuryHelperNode = SCNNode()
    lazy var venusHelperNode = SCNNode()
    lazy var earthHelperNode = SCNNode()
    lazy var marsHelperNode = SCNNode()
    lazy var moonHelperNode = SCNNode()
    lazy var phobosHelperNode = SCNNode()
    lazy var deimosHelperNode = SCNNode()
    
    let sunNode = SunNode()
    
    // for efficient removal of all planet-orbits
    let orbitNode = SCNNode()
    
    // for efficient removal of all planets (entire solar system)
    let solarSystemNode = SCNNode()
    
    // for efficient management of the patterns formed
    let solarSystemPatternNode = SCNNode()

    var lineTimer: Timer?

    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        let scene = setupScene()
        let sceneView = setupSceneView()
        
        // decided not to use particle system as of now
        //let stars = SCNParticleSystem(named: "StarsParticles.scnp", inDirectory: nil)!
        //scene.rootNode.addParticleSystem(stars)
        
        self.view = sceneView
        sceneView.scene = scene

        scene.rootNode.addChildNode(solarSystemNode)
        scene.rootNode.addChildNode(solarSystemPatternNode)
        scene.rootNode.addChildNode(orbitNode)
        
        setupAllPlanets()
        
        // for testing
        scheduledLineDrawingTimer()
    }
    
    func setupScene() -> SCNScene {
        
        let scene = SCNScene()
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x:0, y: 40, z: 0)
        cameraNode.eulerAngles = SCNVector3(x: GLKMathDegreesToRadians(-90), y: 0, z: 0)
        
        scene.rootNode.addChildNode(cameraNode)
        
        let topLightNode = SCNNode()
        topLightNode.light = SCNLight()
        topLightNode.light?.type = .omni
        topLightNode.position = SCNVector3(x: 0, y: 10, z: 2)
        
        scene.rootNode.addChildNode(topLightNode)
        
        let bottomLightNode = SCNNode()
        bottomLightNode.light = SCNLight()
        bottomLightNode.light?.type = .omni
        bottomLightNode.position = SCNVector3(x: 0, y: -10, z: 2)
        
        scene.rootNode.addChildNode(bottomLightNode)
        
        return scene
    }
    
    func setupSceneView() -> SCNView {
        
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        sceneView.showsStatistics = false
        sceneView.backgroundColor = UIColor.black
        sceneView.allowsCameraControl = true
        
        return sceneView
    }
    
    func setupAllPlanets(){
        
        // setup of sun in solar system
        solarSystemNode.addChildNode(sunNode)
        
        if systemConfig.setupMercury == true {
            setupPlanet(planetNode: mercuryNode, planetHelperNode: mercuryHelperNode, planetOrbitalRadius: planetsOrbitalRadius.mercury, planetOrbitalPeriod: planetsOrbitalPeriod.mercury)
        }
        
        if systemConfig.setupVenus == true {
            setupPlanet(planetNode: venusNode, planetHelperNode: venusHelperNode, planetOrbitalRadius: planetsOrbitalRadius.venus, planetOrbitalPeriod: planetsOrbitalPeriod.venus)
        }
        
        if systemConfig.setupEarth == true {
            setupPlanet(planetNode: earthNode, planetHelperNode: earthHelperNode, planetOrbitalRadius: planetsOrbitalRadius.earth, planetOrbitalPeriod: planetsOrbitalPeriod.earth)
        }
        
        if systemConfig.setupMoon == true {
            setupPlanet(planetNode: moonNode, planetHelperNode: moonHelperNode, planetOrbitalRadius: planetsOrbitalRadius.moon, planetOrbitalPeriod: planetsOrbitalPeriod.moon, whoseSatellite: earthNode)
        }
        
        if systemConfig.setupMars == true {
            setupPlanet(planetNode: marsNode, planetHelperNode: marsHelperNode, planetOrbitalRadius: planetsOrbitalRadius.mars, planetOrbitalPeriod: planetsOrbitalPeriod.mars)
        }
        
        if systemConfig.setupPhobos == true {
            setupPlanet(planetNode: phobosNode, planetHelperNode: phobosHelperNode, planetOrbitalRadius: planetsOrbitalRadius.phobos, planetOrbitalPeriod: planetsOrbitalPeriod.phobos, whoseSatellite: marsNode)
        }
        
        if systemConfig.setupMars == true {
            setupPlanet(planetNode: deimosNode, planetHelperNode: deimosHelperNode, planetOrbitalRadius: planetsOrbitalRadius.deimos, planetOrbitalPeriod: planetsOrbitalPeriod.deimos, whoseSatellite: marsNode)
        }
        
    }
    
    private func scheduledLineDrawingTimer(){

        // Scheduling timer to Call the function "updateCounting" with the interval of drawing Frequency
        if lineTimer == nil {
            lineTimer = Timer.scheduledTimer(
                timeInterval: drawingConfig.drawingFrequency,
                target: self,
                selector: #selector(drawLine),
                userInfo: nil,
                repeats: true)
        }
        
        // deactivate to save computing resources
        Timer.scheduledTimer(
            timeInterval: drawingConfig.drawingDuration,
            target: self,
            selector: #selector(deactivateDrawingTimer),
            userInfo: nil,
            repeats: false)
        
        // not to implement for now
        // to change the planets line color after n-orbits or years
        //        Timer.scheduledTimer(
        //            timeInterval: changeColorAfterDuration,
        //            target:self,
        //            selector: #selector(changeLineColor),
        //            userInfo: nil,
        //            repeats:false )
        
    }
    
    //function to create the line
    //called every time interval from the timer
    @objc func drawLine() {

        // so that users can draw line between any planets of their wish
        if drawingConfig.drawFirstLine == true{
            drawLineBetween(fromPlanet: drawingConfig.firstLinePlanetA, toPlanet: drawingConfig.firstLinePlanetB, lineColor: drawingConfig.firstLineColor)
        }
        
        if drawingExtraLineConfig.drawSecondLine == true{
            drawLineBetween(fromPlanet: drawingExtraLineConfig.secondLinePlanetA, toPlanet: drawingExtraLineConfig.secondLinePlanetB, lineColor: drawingExtraLineConfig.secondLineColor)
        }
        
        if drawingExtraLineConfig.drawThirdLine == true {
            drawLineBetween(fromPlanet: drawingExtraLineConfig.thirdLinePlanetA, toPlanet: drawingExtraLineConfig.thirdLinePlanetB, lineColor: drawingExtraLineConfig.thirdLineColor)
        }
        
    }
    
    private func drawLineBetween(fromPlanet: SCNNode, toPlanet: SCNNode, lineColor: UIColor){
        
        let lineThickness: CGFloat = 0.015
        let fromPlanetPosition = SCNVector3(fromPlanet.simdWorldPosition)
        let toPlanetPosition = SCNVector3(toPlanet.simdWorldPosition)
        
        let vector = toPlanetPosition + fromPlanetPosition * (-1)
        let lineLength = vector.length
        
        let cylinder = SCNCylinder(radius: lineThickness , height: CGFloat(lineLength))
        cylinder.radialSegmentCount = 10

        let material = SCNMaterial()
        material.diffuse.contents = lineColor
        cylinder.materials = [material, material, material]
        
        let lineNode = SCNNode(geometry: cylinder)
        lineNode.position = (toPlanetPosition + fromPlanetPosition) * 0.5
        lineNode.eulerAngles = SCNVector3.lineEulerAngles(vector: vector)
        
        solarSystemPatternNode.addChildNode(lineNode)
    }
    
    @objc func deactivateDrawingTimer() {
        // to deactivate timer after n-seconds
        // invalidate timer
        if lineTimer != nil {
            lineTimer?.invalidate()
            lineTimer = nil
        }
        
        if systemConfig.removePlanets == true {
            // if it has been setup before, remove them
            solarSystemNode.removeFromParentNode()
        }
        
        if systemConfig.removeOrbits == true {
            // if it has been setup before, remove them
            orbitNode.removeFromParentNode()
        }
    }
    
    private func setupPlanet(planetNode:SCNNode, planetHelperNode:SCNNode, planetOrbitalRadius: Float, planetOrbitalPeriod: TimeInterval, whoseSatellite: SCNNode? = nil){
        
        if whoseSatellite != nil {
            // place the node under the planet it revolves around
            whoseSatellite?.addChildNode(planetHelperNode)
        } else{
            // position planet in solar system
            solarSystemNode.addChildNode(planetHelperNode)
        }

        planetNode.position = SCNVector3(x: planetOrbitalRadius, y: 0, z: 0)
        planetHelperNode.addChildNode(planetNode)
        
        drawOrbit(orbitDistance: CGFloat(planetOrbitalRadius))
        
        // begin orbit
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:100, z:0), duration: planetOrbitalPeriod)
        let repeatAction = SCNAction.repeatForever(action)
        planetHelperNode.runAction(repeatAction)
        
    }
    
    private func drawOrbit(orbitDistance: CGFloat) {
        
        // dimensions for the sides of the tube
        let tubeThickness: CGFloat = 0.05
        
        let innerRadius = orbitDistance - tubeThickness
        let tubeShape = SCNTube(innerRadius: innerRadius, outerRadius: orbitDistance, height: tubeThickness)
        tubeShape.firstMaterial?.diffuse.contents = UIColor.white
        let eachOrbitNode = SCNNode(geometry: tubeShape)
        
        orbitNode.addChildNode(eachOrbitNode)
    }
    
//    @objc func changeLineColor() {
//
//        to deactivate timer after n-seconds
//        invalidate timer
//        earthVenusLineColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
//        marsVenusLineColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//
//    }
    
    override public var prefersStatusBarHidden: Bool {
        return true
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


