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
    weak var rampPlacerVC: RampPlacerVC!
    
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
        
        
        let pipe = Ramp.getPipe()
        Ramp.startRotation(node: pipe)
        scene.rootNode.addChildNode(pipe)
        
        let pyramid = Ramp.getPyramid()
        Ramp.startRotation(node: pyramid)
        scene.rootNode.addChildNode(pyramid)
        
        let quarter = Ramp.getQuarter()
        Ramp.startRotation(node: quarter)
        scene.rootNode.addChildNode(quarter)
        
        
    }

    @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: sceneView) //get location of the tap in sceneView
        let hitResults = sceneView.hitTest(p, options: [:]) //check if anything was hit
        
        if hitResults.count > 0 { //if we hit an object
            let node = hitResults[0].node
            print(node.name!)
            rampPlacerVC.onRampSelected(rampName: node.name!)
        }
    }
    
    

}
