//
//  ViewController.swift
//  DragAndDrop
//
//  Created by 尚软科技 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController,UIDropInteractionDelegate {

    @IBOutlet weak var backImageView:UIImageView!

    @IBOutlet weak var dropView:UIView!{
        didSet{
            dropView.addInteraction(UIDropInteraction(delegate: self))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool{
        if session.canLoadObjects(ofClass: NSString.self) {
            return true
        }
        if session.canLoadObjects(ofClass: NSURL.self) {
            return true
        }
        if session.canLoadObjects(ofClass: UIImage.self) {
            return true
        }
        return false
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        
           
        return UIDropProposal(operation: .copy)
        
    }

    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSURL.self) { urls in
            if let url = urls.first as? URL{
                print(url.absoluteURL.absoluteString)
            }
        }
       
        
        session.loadObjects(ofClass: UIImage.self) { images in
            if let url = images.first as? UIImage{
                self.backImageView.image = url
                
            }
        }
    }
}

