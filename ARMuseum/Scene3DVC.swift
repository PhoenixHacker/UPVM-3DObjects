//
//  Scene3DVC.swift
//  ARMuseum
//
//  Created by Athos on 5/18/19.
//  Copyright © 2019 code & co. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
class Scene3DVC: UIViewController , ARSCNViewDelegate{
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    @IBAction func dismiss(_ sender: Any) {
self.dismiss(animated: true, completion: nil)
        
        
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
