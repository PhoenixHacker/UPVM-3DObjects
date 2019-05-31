import UIKit

class ImageInformationViewController : UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var LoadView: UIButton!
    
    var imageInformation : ImageInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let actualImageInformation = imageInformation {
            self.nameLabel.text = actualImageInformation.name
            self.imageView.image = actualImageInformation.image
            self.descriptionText.text = actualImageInformation.description
        }
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func LoadVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if nameLabel.text == "Edificio F"{
             let controller  = storyboard.instantiateViewController(withIdentifier: "rectoriaid")
             self.present(controller, animated: true, completion: nil)
        }
        else if nameLabel.text == "Biblioteca" {
            let controller  = storyboard.instantiateViewController(withIdentifier: "bibliotecaid")
             self.present(controller, animated: true, completion: nil)
        }
        else if nameLabel.text == "Edificio A" {
            let controller = storyboard.instantiateViewController(withIdentifier: "informaticaid")
            self.present(controller, animated: true, completion: nil)
            
        }
       
    }
    
   
}
