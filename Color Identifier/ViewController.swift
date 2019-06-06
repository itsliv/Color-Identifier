//
//  ViewController.swift
//  Color Identifier
//
//  Created by Liv J Reinis on 5/13/19.
//  Copyright © 2019 Liv J Reinis. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func launchPhotoPicker(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable( UIImagePickerController.SourceType.camera) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
            let image = info[.originalImage] as! UIImage
            imageView.image =  image

    }
}



extension UIImagePickerController {
    public static func fromImage(imagePicker: UIImagePickerController) -> UIColor {
        var totalR: CGFloat = 0
        var totalG: CGFloat = 0
        var totalB: CGFloat = 0
        
        var count: CGFloat = 0
        
        for x in 0..<Int(imagePicker.width) {
            for y in 0..<Int(imagePicker.height) {
                count += 1
                var rF: CGFloat = 0,
                gF: CGFloat = 0,
                bF: CGFloat = 0,
                aF: CGFloat = 0
                image.getPixelColor(CGPoint(x: x, y: y)).getRed(&rF, green: &gF, blue: &bF, alpha: &aF)
                totalR += rF
                totalG += gF
                totalB += bF
            }
        }
        
        let averageR = totalR / count
        let averageG = totalG / count
        let averageB = totalB / count
        
        return UIColor(red: averageR, green: averageG, blue: averageB, alpha: 1.0)
    }
}

extension UIImageView {
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        let pixelData = CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage))
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

