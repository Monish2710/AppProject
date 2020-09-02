//
//  ViewController.swift
//  AppProject
//
//  Created by APPLE on 01/09/20.
//  Copyright © 2020 Technize. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var avabtn: UIButton!
    @IBOutlet weak var hintlabel: UILabel!
    @IBOutlet weak var emailtxt: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passtextfield: UITextField!
    @IBOutlet weak var passworderror: UILabel!
    @IBOutlet weak var passwordlbl: UILabel!
    @IBOutlet weak var emailerror: UILabel!
    @IBOutlet weak var subbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarImage.layer.cornerRadius = self.avatarImage.frame.size.width / 2
        self.avatarImage.clipsToBounds = true
        self.subbtn.layer.cornerRadius = 30
        subbtn.isUserInteractionEnabled = false

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func emailValidate(_ sender: Any) {
        let text = emailTextfield.text ?? ""
        if text.isValidEmail() {
        emailTextfield.textColor = UIColor.black
        emailerror.text = ""
        } else {
        emailTextfield.textColor = UIColor.red
        emailerror.text = "Please enter a valid email"
        }
    }
    
    @IBAction func passValidate(_ sender: Any)
    {
        let text = passtextfield.text ?? ""
                    if text.isValidPassword() {
                        passtextfield.textColor = UIColor.black
                        passworderror.text = "Strong Password"
                        passworderror.textColor = UIColor.green
                        subbtn.isUserInteractionEnabled = true
                    } else {
                        passtextfield.textColor = UIColor.red
                        passworderror.text = "Weak password"
                        passworderror.textColor = UIColor.red
                        subbtn.isUserInteractionEnabled = false
                    }
    }
    
    @IBAction func submitaction(_ sender: Any) {
        let addpopup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.addChild(addpopup)
        addpopup.view.frame = self.view.frame
        self.view.addSubview(addpopup.view)
        addpopup.didMove(toParent: self)
    }
    @IBAction func avatorButton(_ sender: Any)
    {
               let image = UIImagePickerController()
                image.delegate = self
                image.sourceType = UIImagePickerController.SourceType.photoLibrary
                image.allowsEditing = false
                self.present(image, animated: true)
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(showLabel), userInfo: nil, repeats: false)
    }
    @objc func showLabel() {
        hintlabel.isHidden = true
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
               if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                   avatarImage.image = pickedImage
    }
               dismiss(animated: true, completion: nil)
    }
}

 extension String
 {
     func isValidEmail() -> Bool {
         let inputRegEx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,64}"
         let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
         return inputpred.evaluate(with:self)
     }

     func isValidPassword() -> Bool {
         let inputRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_+={}?>.<,:;~`']{8,}$"
         let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
         return inputpred.evaluate(with:self)
     }
 }



