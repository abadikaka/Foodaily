//
//  HomeViewController.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/6/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerHomeView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchImageContainerView: UIView!
    
    //let headerImage : UIImage = UIImage(named: "background-2")!
    let navRightButton : UIImage = UIImage(named: "more")!
    let navLeftButton : UIImage = UIImage(named: "drawer")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupHeaderView()
    }

    private func setupHeaderView(){
        //headerHomeView.image = headerImage
        headerHomeView.contentMode = .scaleAspectFill
        headerHomeView.clipsToBounds = true
        
        searchImageContainerView.layer.cornerRadius = searchImageContainerView.frame.width / 2
        searchImageContainerView.layer.masksToBounds = true
        searchImageView.tintColor = .white
        
    }
    
    private func setupNavigationBar(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        view.backgroundColor = .clear
        self.navigationController?.view.addSubview(view)
        
        let buttonRight: UIButton = UIButton(type: .custom)
        let buttonRightImage : UIImage = navRightButton
        let buttonLeft: UIButton = UIButton(type: .custom)
        let buttonLeftImage : UIImage = navLeftButton
        
        buttonRight.setImage(buttonRightImage, for: .normal)
        buttonRight.addTarget(self, action:#selector(handleNavigationDrawerButton), for: UIControlEvents.touchUpInside)
        buttonRight.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        buttonRight.tintColor = UIColor(rgb: 0x96281B)
        let barRightButton = UIBarButtonItem(customView: buttonRight)
        
        buttonLeft.setImage(buttonLeftImage, for: .normal)
        buttonRight.addTarget(self, action:#selector(handleMoreButton), for: UIControlEvents.touchUpInside)
        buttonLeft.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        buttonLeft.tintColor = UIColor(rgb: 0x96281B)
        let barLeftButton = UIBarButtonItem(customView: buttonLeft)
        
        
        navigationItem.rightBarButtonItem = barRightButton
        navigationItem.leftBarButtonItem = barLeftButton
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    @objc private func handleNavigationDrawerButton(){
        
    }
    
    @objc private func handleMoreButton(){
        
    }
    
    
}
