//
//  PlanetNodes.swift
//  Book_Sources
//
//  Created by Steven Tan on 23/3/19.
//
import UIKit
import Foundation
import PlaygroundSupport
import SceneKit

var sunSize:CGFloat = 0.40
var mercurySize:CGFloat = 0.20
var venusSize:CGFloat = 0.45
var earthSize:CGFloat = 0.45
var marsSize:CGFloat = 0.20
var moonSize:CGFloat = 0.15
var phobosSize:CGFloat = 0.15
var deimosSize:CGFloat = 0.15

var sunDuration = 5
var mercuryDuration = 5
var venusDuration = 8
var earthDuration = 2
var marsDuration = 3
var moonDuration = 4
var phobosDuration = 6
var deimosDuration = 4

public class SunNode: SCNNode {
    
    override public init() {
        
        super.init()
        self.geometry = SCNSphere(radius: sunSize)
        
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow

        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: TimeInterval(sunDuration))

        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

public class EarthNode: SCNNode {
    
    override public init() {
        super.init()
        self.geometry = SCNSphere(radius: earthSize)
        

        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named:"Earth_Diffuse")

        
        self.geometry?.firstMaterial?.shininess = 50
        
        // duration is The duration, in seconds, of the animation.
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
        
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

public class VenusNode: SCNNode {
    
    override public init() {
        super.init()
        self.geometry = SCNSphere(radius: venusSize)
        
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named:"Venus")

        
        self.geometry?.firstMaterial?.shininess = 50
        
        //        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        //
        //        let repeatAction = SCNAction.repeatForever(action)
        //
        //        self.runAction(repeatAction)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

public class MercuryNode: SCNNode {
    
    override public init() {
        super.init()
        self.geometry = SCNSphere(radius: earthSize)
        
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
        
        self.geometry?.firstMaterial?.shininess = 50
        
        // duration is The duration, in seconds, of the animation.
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
        
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

public class MarsNode: SCNNode {
    override public init() {
        super.init()
        self.geometry = SCNSphere(radius: marsSize)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named:"Mars")
        
        
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: TimeInterval(marsDuration))
        
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

public class MoonNode: SCNNode {
    override public init() {
        super.init()
        self.geometry = SCNSphere(radius: moonSize)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named:"Moon")
        
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: TimeInterval(moonDuration))
        
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

public class PhobosNode: SCNNode {
    override public init() {
        super.init()
        self.geometry = SCNSphere(radius: phobosSize)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named:"Phobos")
        
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: TimeInterval(phobosDuration))
        
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

public class DeimosNode: SCNNode {
    override public init() {
        super.init()
        self.geometry = SCNSphere(radius: deimosSize)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named:"Deimos")
        
        
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: TimeInterval(deimosDuration))
        
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

