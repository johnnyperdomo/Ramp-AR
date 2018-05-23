//
//  Ramp.swift
//  ramp-up
//
//  Created by Johnny Perdomo on 5/23/18.
//  Copyright © 2018 Johnny Perdomo. All rights reserved.
//

import Foundation
import SceneKit

class Ramp {
    
    class func getRampForName(rampName: String) -> SCNNode {
        switch rampName {
        case "pipe":
            return Ramp.getPipe()
        case "quarter":
            return Ramp.getQuarter()
        case "pyramid":
            return Ramp.getPyramid()
        default:
           return Ramp.getPipe()
        }
    }
    
    
    class func getPipe() -> SCNNode {
        let pipeObj = SCNScene(named: "art.scnassets/pipe.dae")  //pipe scene
        let pipeNode = pipeObj?.rootNode.childNode(withName: "pipe", recursively: true)! //calls the specific object in the scene(node)..calls it by identifier
        pipeNode?.scale = SCNVector3Make( 0.0025, 0.0025,0.0025) //change the scale size of the ramp
        pipeNode?.position = SCNVector3Make(-1, 0.7, -1)
        return pipeNode!
    }
    
    class func getPyramid() -> SCNNode {
        let pyramidObj = SCNScene(named: "art.scnassets/pyramid.dae") //pyramid scene
        let pyramidNode = pyramidObj?.rootNode.childNode(withName: "pyramid", recursively: true)!
        pyramidNode?.scale = SCNVector3Make(0.006, 0.006, 0.006)
        pyramidNode?.position = SCNVector3Make(-1, -0.3, -1)
        return pyramidNode!
    }
    
    class func getQuarter() -> SCNNode {
        let quarterObj = SCNScene(named: "art.scnassets/quarter.dae") //quarterPipe scene
        let quarterNode = quarterObj?.rootNode.childNode(withName: "quarter", recursively: true)!
        quarterNode?.scale = SCNVector3Make(0.006, 0.006, 0.006)
        quarterNode?.position = SCNVector3Make(-1, -2, -1)
        return quarterNode!
    }
    
    class func startRotation(node: SCNNode) {
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1)) //to rotate
        node.runAction(rotate)
    }
}
