//
//  ViewController.swift
//  ExperimentalProject
//
//  Created by Zeshan Ahmad on 27/02/2019.
//  Copyright © 2019 Zeshan Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var doneSwelection = false
    var lastContentOffset:CGFloat = 0.0
    var selectedIndexPath:IndexPath!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.collectionView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.collectionView.addGestureRecognizer(swipeRight)
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
              if(collectionView.numberOfItems(inSection: 0) > selectedIndexPath.row - 1){
            let indexPath = IndexPath(item: selectedIndexPath.row - 1, section: 0)
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            selectedIndexPath = indexPath
//            collectionView.scrollToItem(at: (indexPath), at: .centeredHorizontally, animated: true)
              }else{
                return
            }
            
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
           
            if(collectionView.numberOfItems(inSection: 0) > (selectedIndexPath.row + 1)){
                let indexPath = IndexPath(item: selectedIndexPath.row + 1, section: 0)
                
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
                selectedIndexPath = indexPath
                } else {
                
                return
            }
            
        }
       
    }

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CustomCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(indexPath.row == 2 && !self.doneSwelection){
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            doneSwelection = true
            cell.isSelected = true
            self.selectedIndexPath = indexPath
        }
    }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        self.selectedIndexPath = indexPath
    }
    
}
