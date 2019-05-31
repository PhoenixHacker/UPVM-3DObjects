//
//  InformaticaVC.swift
//  ARMuseum
//
//  Created by Athos on 5/30/19.
//  Copyright © 2019 code & co. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
class InformaticaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene(named: "art.scnassets/InformaticaShip.scn")
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene?.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x: 0, y: 0, z:15)
    
        let ligthNode = SCNNode()
        ligthNode.light = SCNLight()
        ligthNode.light!.type = .omni
        ligthNode.position = SCNVector3(x: 10, y: 10, z:10)
        scene?.rootNode.addChildNode(ligthNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        
        let scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handletap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handletap(_ gestureRecognize: UIGestureRecognizer){
        let scnView = self.view as! SCNView
        let p = gestureRecognize.location(in: scnView)
        let hitresult = scnView.hitTest(p, options: [:])
        
        
        if hitresult.count > 0 {
            let result = hitresult[0]
            let material = result.node.geometry!.firstMaterial!
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                material.emission.contents = UIColor.black
                SCNTransaction.commit()
                self.dismiss(animated: true, completion: nil)
            }
        material.emission.contents = UIColor.red
            SCNTransaction.commit()
             
        }
        
       
        
    }
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override var   supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if  UIDevice.current.userInterfaceIdiom == .phone{
            return .allButUpsideDown
        }
        else {
            return .all
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
