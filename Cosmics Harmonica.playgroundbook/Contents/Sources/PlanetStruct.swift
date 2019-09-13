//
//  PlanetStruct.swift
//  Book_Sources
//
//  Created by Steven Tan on 23/3/19.
//
import Foundation
import SceneKit
import UIKit

public struct PlanetsOrbitalRadius {
    
    // orbital duration around Sun
    public var mercury: Float
    public var venus: Float
    public var earth: Float
    public var mars: Float
    
    // Orbital-Duration for Natural Satellites
    public var moon: Float
    public var phobos: Float
    public var deimos: Float
    
    public init(){
        
        // default value
        // orbital duration around Sun
        self.mercury = 2
        self.venus = 8
        self.earth = 13
        self.mars = 17
        
        // Orbital-Radius for Natural Satellites
        self.moon = 6
        self.phobos = 6
        self.deimos = 6
    }
}

public struct PlanetsOrbitalPeriod {
    
    // orbital duration around Sun
    public var mercury:TimeInterval
    public var venus:TimeInterval
    public var earth:TimeInterval
    public var mars:TimeInterval
    
    // Orbital-Duration for Natural Satellites
    public var moon: TimeInterval
    public var phobos:TimeInterval
    public var deimos: TimeInterval
    
    public init(){
        
        // default value
        // orbital duration around Sun
        self.mercury = 0.88
        self.venus = 2.25
        self.earth = 3.65
        self.mars = 6.87
        
        // Orbital-Duration for Natural Satellites
        self.moon = 0.27
        self.phobos = 0.03
        self.deimos = 1.3
    }
}

public struct SolarSystemConfig {
    
    // orbital duration around Sun
    public var removePlanets: Bool
    public var removeOrbits: Bool
    public var setupMercury: Bool
    public var setupVenus: Bool
    public var setupEarth: Bool
    public var setupMars: Bool
    public var setupMoon: Bool
    public var setupPhobos: Bool
    public var setupDeimos: Bool
    
    public init(){
        
        //default for system
        self.removePlanets = true
        self.removeOrbits = true
        self.setupMercury = false
        self.setupVenus = true
        self.setupEarth = true
        self.setupMars = false
        self.setupMoon = false
        self.setupPhobos = false
        self.setupDeimos = false
        
    }
}

public struct DrawingConfig {
    
    public var drawingFrequency: TimeInterval
    public var drawingDuration: TimeInterval
    public var changeColorAfterDuration: TimeInterval
    
    public var drawFirstLine: Bool
    public var firstLinePlanetA: SCNNode
    public var firstLinePlanetB: SCNNode
    public var firstLineColor: UIColor
    
    public init(){
        
        self.drawingFrequency = 0.01
        self.drawingDuration = 29.2
        self.changeColorAfterDuration = 5
        
        self.drawFirstLine = true
        self.firstLinePlanetA = earthNode
        self.firstLinePlanetB = venusNode
        self.firstLineColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
}

public struct DrawingExtraLineConfig {
    
    public var drawSecondLine: Bool
    public var secondLinePlanetA: SCNNode
    public var secondLinePlanetB: SCNNode
    public var secondLineColor: UIColor
    
    public var drawThirdLine: Bool
    public var thirdLinePlanetA: SCNNode
    public var thirdLinePlanetB: SCNNode
    public var thirdLineColor: UIColor
    
    public init(){
        
        self.drawSecondLine = false
        self.secondLinePlanetA = earthNode
        self.secondLinePlanetB = venusNode
        self.secondLineColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        self.drawThirdLine = false
        self.thirdLinePlanetA = earthNode
        self.thirdLinePlanetB = venusNode
        self.thirdLineColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
}
