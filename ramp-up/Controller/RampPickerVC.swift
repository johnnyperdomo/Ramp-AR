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
        
    }


}
