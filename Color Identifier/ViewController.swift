//
//  ViewController.swift
//  Color Identifier
//
//  Created by Liv J Reinis on 5/13/19.
//  Copyright © 2019 Liv J Reinis. All rights reserved.
//

import UIKit

internal class ViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func launchPhotoPicker(_ sender: Any) {
    }
    
    internal func UIImagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
}
