//
//  HomeViewController.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/6/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerHomeView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchImageContainerView: UIView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var addPost: RoundedButton!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpTableView: UITableView!
    
    //view model for pop up
    fileprivate let viewModel = PopUpViewModel()
    
    let loginView = LoginViewController()
    let navRightButton : UIImage = UIImage(named: "more")!
    let navLeftButton : UIImage = UIImage(named: "drawer")!
    
    //identifier
    let identifier = "categoryIdentifier"
    let headerIdentifier = "categoryHeaderIdentifier"
    let collectionNibName = "CategoryCell"
    let popUpNibName = "PopUpCell"
    let headerNibName = "CategoryHeaderView"
    let imageButtonName = "plus"
    let headerViewBackground = "background-1"
    let loginViewControllerIdentifier = "LoginViewController"
    
    //collectionView
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
    let itemsPerRow: CGFloat = 3
    let headerSectionHeight: CGFloat = 50.0
    let dataSource = CategoryDataSource()
    let loginStatus = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if loginStatus {
          presentLoginView()
        }
        
        setupNavigationBar()
        setupHeaderView()
        setupCollectionView()
        setupAddPostButton()
        setupPopUpView()
    }
    
    
    private func setupPopUpView(){
        
        let shadowView = UIView(frame: CGRect(x: popUpView.frame.origin.x, y: popUpView.frame.origin.y, width: popUpView.frame.width, height: popUpView.frame.height))
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: -1, height: 1)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 5
        
        view.addSubview(shadowView)
        
        popUpView.layer.cornerRadius = 5.0
        popUpView.layer.masksToBounds = true
        
        shadowView.addSubview(popUpView)
        
        viewModel.cellDelegate = self
        popUpTableView?.dataSource = viewModel
        popUpTableView?.delegate = viewModel
        popUpTableView?.estimatedRowHeight = 100
        popUpTableView?.rowHeight = UITableViewAutomaticDimension
        
        popUpTableView?.register(PopUpTitleCell.nib, forCellReuseIdentifier: PopUpTitleCell.identifier)
        popUpTableView?.register(PopUpCategoryCell.nib, forCellReuseIdentifier: PopUpCategoryCell.identifier)
        popUpTableView?.register(PopUpIngredientStepCell.nib, forCellReuseIdentifier: PopUpIngredientStepCell.identifier)
        popUpTableView?.register(PopUpPostCell.nib, forCellReuseIdentifier: PopUpPostCell.identifier)
    }
    
    private func presentLoginView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: loginViewControllerIdentifier)
        navigationController?.present(controller, animated: false, completion: nil)
    }
    
    private func setupAddPostButton(){
        addPost.setButtonProperties(cornerRadius: addPost.frame.width / 2, backgroundColor: UIColor.white, titleColor: UIColor.white, titleColorHighlighted: UIColor.white, borderColor: UIColor.clear, borderWidth: 0)
        addPost.setImage(UIImage(named: imageButtonName), for: .normal)
    }
    
    private func setupCollectionView(){
        let nib = UINib(nibName: collectionNibName, bundle: nil)
        let headerNib = UINib(nibName: headerNibName, bundle: nil)
        foodCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        foodCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
    }
    
    private func setupHeaderView(){
        var image = UIImage(named: headerViewBackground)
        image = image?.resizeImageWithWidth(sourceImage: image!, scaledToWidth: headerView.frame.width)
        headerView.backgroundColor = UIColor(patternImage: image!)
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
        buttonRight.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        buttonRight.tintColor = UIColor(rgb: 0x96281B)
        let barRightButton = UIBarButtonItem(customView: buttonRight)
        
        buttonLeft.setImage(buttonLeftImage, for: .normal)
        buttonRight.addTarget(self, action:#selector(handleMoreButton), for: UIControlEvents.touchUpInside)
        buttonLeft.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        buttonLeft.tintColor = UIColor(rgb: 0x96281B)
        let barLeftButton = UIBarButtonItem(customView: buttonLeft)
        
        
        navigationItem.rightBarButtonItem = barRightButton
        navigationItem.leftBarButtonItem = barLeftButton
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    @IBAction func handleAddPost(_ sender: Any) {
        
    }
    
    
    @objc private func handleNavigationDrawerButton(){
        
    }
    
    @objc private func handleMoreButton(){
        
    }
    
    
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    //UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.groups.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numbeOfRowsInEachGroup(index: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,for:indexPath) as! CategoryCell
        
        let categories: [Category] = dataSource.categoryInGroup(index: indexPath.section)
        let category = categories[indexPath.row]
        
        let name = category.name!
        let image = category.image!
        
        cell.imageView.image = UIImage(named: image)
        cell.caption.text = name.capitalized
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! CategoryHeaderView
        
        headerView.sectionLabel.text = dataSource.gettGroupLabelAtIndex(index: indexPath.section)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:headerSectionHeight)
    }
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width - paddingSpace
        let cellWidth = screenWidth / itemsPerRow
        let size = CGSize(width: cellWidth, height: cellWidth + 50)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

}


extension HomeViewController: CellAddedDelegate {
    func addedNewCell(inSection: Int, cellId: Int) {
        UIView.setAnimationsEnabled(false)
        popUpTableView?.beginUpdates()
        let item = viewModel.items[inSection]
        if let item = item as? PopUpModelIngredient {
            item.ingredientsCell += 1
            popUpTableView?.insertRows(at: [IndexPath(row: cellId, section: inSection)], with: .automatic)
        }else if let item = item as? PopUpModelStep {
            item.stepsCell += 1
            popUpTableView?.insertRows(at: [IndexPath(row: cellId, section: inSection)], with: .automatic)
        }
        popUpTableView?.endUpdates()
        
        //UIView.setAnimationsEnabled(false)
        //popUpTableView?.beginUpdates()
        //popUpTableView?.reloadSections(NSIndexSet(index: inSection) as IndexSet, with: .none)
        //popUpTableView?.endUpdates()
        print("added in section \(inSection) and cell id \(cellId)")
    }
}
