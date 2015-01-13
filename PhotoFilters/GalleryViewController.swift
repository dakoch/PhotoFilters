//
//  GalleryViewController.swift
//  PhotoFilters
//
//  Created by Gru on 01/12/15.
//  Copyright (c) 2015 GruTech. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDataSource {

    var collectionView : UICollectionView!
    var images  = [UIImage]()

    override func loadView() {
        let rootView = UIView(frame: UIScreen.mainScreen().bounds)
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: rootView.frame, collectionViewLayout: collectionViewFlowLayout)
        rootView.addSubview(self.collectionView)
        self.collectionView.dataSource = self
        collectionViewFlowLayout.itemSize = CGSize(width: 200, height: 200)

        self.view = rootView
    }

    // W2.D1.04[ ] In the gallery view controller, display at least 6 photos in your gallery
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.collectionView.registerClass(GalleryCell.self, forCellWithReuseIdentifier: "GALLERY_CELL")
        let image1 = UIImage(named: "bambo.jpg")
        let image2 = UIImage(named: "tagTypeController.JPG")
        let image3 = UIImage(named: "glasshouse.jpg")
        let image4 = UIImage(named: "photo-1d.jpeg")
        let image5 = UIImage(named: "photo-1c.jpeg")
        let image6 = UIImage(named: "photo-1b.jpeg")
        let image7 = UIImage(named: "windows.jpg")

        self.images.append(image1!)
        self.images.append(image2!)
        self.images.append(image3!)
        self.images.append(image4!)
        self.images.append(image5!)
        self.images.append(image6!)
        self.images.append(image7!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 'collectionView()'s
    func collectionView( collectionView: UICollectionView, numberOfItemsInSection section: Int ) -> Int {
        return self.images.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier( "GALLERY_CELL", forIndexPath: indexPath ) as GalleryCell
        let image = self.images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
