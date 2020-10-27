//
//  ViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2020/10/27.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let message = "aaa";
        
        guard let camera = sceneView.pointOfView else { return }

                let textGeometry = SCNText(string: message, extrusionDepth: 0.8)
                textGeometry.firstMaterial?.diffuse.contents = UIColor(named: "ArizarARFontColor")
                textGeometry.font = UIFont(name: "HiraginoSans-W6", size: 100)
                let textNode = SCNNode(geometry: textGeometry)
                let position = SCNVector3(0,0.1,-0.1)
                textNode.position = camera.convertPosition(position, to: nil)
                //カメラの向きに合わせる
                textNode.eulerAngles = camera.eulerAngles
                //大きさ設定
                textNode.scale = SCNVector3(0.0001,0.0001,0.001)

                sceneView.scene.rootNode.addChildNode(textNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
