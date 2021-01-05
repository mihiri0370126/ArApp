//
//  ViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2020/10/27.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation
import QRScanner

class ViewController: UIViewController, ARSCNViewDelegate,AVCaptureMetadataOutputObjectsDelegate,UIViewControllerTransitioningDelegate {

    @IBOutlet var sceneView: ARSCNView!

    @IBOutlet weak var messageLabel: UILabel!
    

    
    
    @IBOutlet weak var resalt: UILabel!
    
    var modalVC :UIViewController! = nil
    
    var cnt:Int = 0
    var msg :String?
    
    let VC = TestViewController()
    
    var choose : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
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
        //テキストオブジェクトをsenseViewに表示
        sceneView.scene.rootNode.addChildNode(textNode)
        
//        modalVC! = self.storyboard.instantiateViewController(withIdentifier: "modal")
//        modalVC!.modalPresentationStyle = .custom
//        modalVC!.transitioningDelegate = self
        
        let testViewC = self.storyboard?.instantiateViewController(withIdentifier: "modal") as! TestViewController
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main)
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = referenceImages!
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
    
    
    //設定したアンカーを読み取ったときの処理
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor {
            var imageName = imageAnchor.referenceImage.name
            
            if(imageName == "rukiroki"){
                print("rukiroki")
            }else if(imageName == "1"){
                print("1")
            }else if(imageName == "ikasumi"){
                print("ikasumi")
            }
            // 目的の画像を青い面をかぶせる
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor.blue
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
        }
        return node
    }
    
    
    //QRコードをカメラで認識したときの処理
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        let session = sceneView.session

        
        if let frame = session.currentFrame{
            let qrResponses = QRScanner.findQR(in: frame)
            for response in qrResponses {
                print(response.feature.messageString ?? "no message found")
                msg = response.feature.messageString ?? "no message found"
                if(response.feature.messageString != nil){
                    cnt = cnt + 1
                    print(cnt)
                    if(cnt == 1){
                        //画面を描画するラグを制御
                        usleep(5 * 100000);
                        dsss()
                    }
                }
            }
            
        } 
    }
    
    
    
    
    

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func ddd(){
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modal")
        modalVC!.modalPresentationStyle = .custom
        modalVC!.transitioningDelegate = self
        present(modalVC!, animated: true, completion: nil)
    }

    func dsss(){
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "ModalS", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //移動する変数vcを定義する
        let vc = segue.destination as! TestViewController
        //TestViewControllerのtextFieldのテキストを代入
        vc.QrText = self.msg!
//        vc.navi = self.choose!
//        vc.navi = self.choose!
        }
}
