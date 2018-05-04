//
//  RampPickerVC.swift
//  ramp-up
//
//  Created by Johnny Perdomo on 4/30/18.
//  Copyright © 2018 Johnny Perdomo. All rights reserved.
//

import UIKit
import SceneKit

class RampPickerVC: UIViewController {

    var sceneView: SCNView! //scene view
    var size: CGSize!
    
    init(size: CGSize) { //initializer to pass in the size
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //configuring our popupView
        view.frame = CGRect(origin: CGPoint.zero, size: size)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.insertSubview(sceneView, at: 0)
        
        preferredContentSize = size
        
        let scene = SCNScene(named: "art.scnassets/ramps.scn")! //shows the 3d world model
        sceneView.scene = scene
        
        let camera = SCNCamera() //set a specific camera view
        camera.usesOrthographicProjection = true //camera type
        scene.rootNode.camera = camera //add it
        
        let pipeObj = SCNScene(named: "art.scnassets/pipe.dae")  //pipe scene
        let pipeNode = pipeObj?.rootNode.childNode(withName: "pipe", recursively: true)! //calls the specific object in the scene(node)..calls it by identifier
        pipeNode?.scale = SCNVector3Make( 0.0025, 0.0025,0.0025) //change the scale size of the ramp
        pipeNode?.position = SCNVector3Make(-1, 0.7, -1)
        scene.rootNode.addChildNode(pipeNode!) //add the node to this scene
        
        
        let pyramidObj = SCNScene(named: "art.scnassets/pyramid.dae") //pyramid scene
        let pyramidNode = pyramidObj?.rootNode.childNode(withName: "pyramid", recursively: true)!
        pyramidNode?.scale = SCNVector3Make(0.006, 0.006, 0.006)
        pyramidNode?.position = SCNVector3Make(-1, -0.3, -1)
        scene.rootNode.addChildNode(pyramidNode!) //add the node to scene
        
        let quarterObj = SCNScene(named: "art.scnassets/quarter.dae") //quarterPipe scene
        let quarterNode = quarterObj?.rootNode.childNode(withName: "quarter", recursively: true)!
        quarterNode?.scale = SCNVector3Make(0.006, 0.006, 0.006)
        quarterNode?.position = SCNVector3Make(-1, -2, -1)
        scene.rootNode.addChildNode(quarterNode!)
        
    }


}
