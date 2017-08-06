//
//  LoginViewController.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/2/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var registerButton: RoundedButton!
    @IBOutlet weak var facebookButton: RoundedButton!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    
    let backgroundImage : UIImage = UIImage(named: "background-3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    private func setupView(){
        view.backgroundColor = UIColor(patternImage: backgroundImage)
        headerImageView.tintColor = UIColor(rgb:0x96281B)
        overlayView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
        overlayView.frame = view.frame
        registerButton.setButtonProperties(cornerRadius: 10, backgroundColor: UIColor(rgb:0x96281B), titleColor: .white, titleColorHighlighted: UIColor(rgb: 0x2c3e50), borderColor: .black, borderWidth: 0)
        facebookButton.setButtonProperties(cornerRadius: 10, backgroundColor: UIColor(rgb:0x3B5998), titleColor: .white, titleColorHighlighted: UIColor(rgb: 0x2c3e50), borderColor: .black, borderWidth: 0)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
