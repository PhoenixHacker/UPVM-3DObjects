import UIKit
import SpriteKit
import ARKit
import CoreML
import SceneKit

struct ImageInformation {
    let name: String
    let description: String
    let image: UIImage
}

class ViewController: UIViewController, ARSKViewDelegate {
    @IBOutlet var sceneView: ARSKView!
    var selectedImage : ImageInformation?
    
    let images = ["rectoria" : ImageInformation(name: "Edificio F", description: "Aqui son oficinas mas que nada, lugar donde la gente viene a morir y a re inscribirse, si, este texto es de prueba, me pregunto si han solo seguia vivo?", image: UIImage(named: "maxresdefault")!)]
   
    let images2 = ["steve" : ImageInformation(name: "Steve Jobs", description: "In Memory of you - Athos", image: UIImage(named: "steve")!)]
    
    let images3 = ["BibliotecaQR" : ImageInformation(name: "Biblioteca", description: "La biblioteca de la Universidad Politecnica del Valle de Mexico, equipada con computadoras y libros enforcados en las diferentes carreras impartidas en la institución. Facil acceso, libre del humo de cigarro, cubiculos de estudio para los alumnos y profesores, internet de alta velocidad, renta de software, peliculas, musica , etc, sala de conferencias, tambien se realizan actividades culturales como presentacion de libros y autores.", image: UIImage(named: "BibliotecaUPVM")!)]
    
    let images4 = ["InformaticaQR" : ImageInformation(name: "Edificio A", description: "El Edificio A fue el primer edifico construido en el año 2006, actualmente es usado por la carrera de Informatica y aloja algunos de los diferentes servicios y plataformas digitales para los alumnos, Tambien se encuentra la seccion de Control escolar, la cual se encarga de administrar el control estudiantil.", image: UIImage(named: "InformaticaFoto")!) ]
    
    let images5 = [""]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "Mona Lisa Room", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    

    // MARK: - ARSKViewDelegate
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        
        if let imageAnchor = anchor as? ARImageAnchor,
            let referenceImageName = imageAnchor.referenceImage.name,
            let scannedImage =  self.images[referenceImageName] {
            
            self.selectedImage = scannedImage
            
            self.performSegue(withIdentifier: "showImageInformation", sender: self)
            self.viewDidLoad()
          
        }
        else if let imageAnchor = anchor as? ARImageAnchor,
                let referenceImageName = imageAnchor.referenceImage.name,
                let scannedImage =  self.images2[referenceImageName] {
                
                self.selectedImage = scannedImage
                
                self.performSegue(withIdentifier: "showImageInformation", sender: self)
                self.viewDidLoad()
            
        }
        
        else if let imageAnchor = anchor as? ARImageAnchor,
            let referenceImageName = imageAnchor.referenceImage.name,
            let scannedImage =  self.images3[referenceImageName] {
            
            self.selectedImage = scannedImage
            
            self.performSegue(withIdentifier: "showImageInformation", sender: self)
            self.viewDidLoad()
            
        }
        else if let imageAnchor = anchor as? ARImageAnchor,
        let refereneImageName = imageAnchor.referenceImage.name,
            let scannedImage = self.images4[refereneImageName]{
            self.selectedImage = scannedImage
            self.performSegue(withIdentifier: "showImageInformation", sender: self)
            self.viewDidLoad()
        }
        
        return nil
    }
    
    
    
    
    
    private func imageSeenMarker() -> SKLabelNode {
        let labelNode = SKLabelNode(text: "✅")
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
      
        return labelNode
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImageInformation"{
            if let imageInformationVC = segue.destination as? ImageInformationViewController,
                let actualSelectedImage = selectedImage {
                imageInformationVC.imageInformation = actualSelectedImage
            }
        }
    }
}
