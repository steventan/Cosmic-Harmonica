//
//  Utilities.swift
//  Book_Sources
//
//  Created by Steven Tan on 23/3/19.
//

import Foundation
import SceneKit

extension Float {
    var squared: Float {
        return self * self
    }
}

public extension SCNVector3 {
    
    static var zero: SCNVector3 {
        return SCNVector3(0, 0, 0)
    }
    
    func distance(from anotherVector: SCNVector3) -> Float {
        return ((self.x - anotherVector.x).squared
            + (self.y - anotherVector.y).squared
            + (self.z - anotherVector.z).squared).squareRoot()
    }
    
    var length: Float {
        get {
            return Float(sqrt(self.x.squared + self.y.squared + self.z.squared))
        }
    }
    
    static func +(lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
    }
    
    static func *(lhs: SCNVector3, rhs: Float) -> SCNVector3 {
        return SCNVector3(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
    }
    
    static func *(lhs: SCNVector3, rhs: SCNVector3) -> Float {
        return lhs.x * rhs.x + lhs.y * rhs.y + lhs.z * rhs.z
    }
    
    func theta(from anotherVector: SCNVector3) -> Float {
        return acos(self * anotherVector / (self.length * anotherVector.length))
    }
    
    static func lineEulerAngles(vector: SCNVector3) -> SCNVector3 {
        let height = vector.length
        let xzLength = sqrt(vector.x * vector.x + vector.z * vector.z)
        let pitchB = vector.y < 0 ? Float.pi - asinf(xzLength / height) : asinf(xzLength / height)
        let pitch = vector.z == 0 ? pitchB : sign(vector.z) * pitchB
        
        var yaw: Float = 0
        if vector.x != 0 || vector.z != 0 {
            let inner = vector.x / (height * sinf(pitch))
            if inner > 1 || inner < -1 {
                yaw = Float.pi / 2
            } else {
                yaw = asinf(inner)
            }
        }
        return SCNVector3(CGFloat(pitch), CGFloat(yaw), 0)
    }
    
}

