//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Gru on 01/12/15.
//  Copyright (c) 2015 GruTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // iOS 8 Tutorials, 161p UIAlertController
    let alertController = UIAlertController( title: "Title", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet )

    override func loadView() {

        // Helps w/ contraints going off the screen.
        let rootView = UIView( frame: UIScreen.mainScreen().bounds )
            rootView.backgroundColor = UIColor.grayColor()

        let photoButton = UIButton()
            photoButton.setTranslatesAutoresizingMaskIntoConstraints( false )

            photoButton.setTitle( "Photos", forState: .Normal )
            photoButton.setTitleColor( UIColor.blackColor(), forState: .Normal )
            photoButton.addTarget( self, action: "photoButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

            rootView.addSubview( photoButton )

        let views = ["photoButton" : photoButton]

        // Call method to set constrains on 'rootView'
        self.setupConstraintsOnRootView( rootView, forViews: views )
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // W2.D1.02[x] Add an alert controller with the style set to action sheet
        let galleryOption = UIAlertAction( title: "Gallery", style: UIAlertActionStyle.Default ) { (action) -> Void in
            println( "Gallery pressed" )
            let galleryVC = GalleryViewController()
            self.navigationController?.pushViewController( galleryVC, animated: true )
        }
        self.alertController.addAction( galleryOption )

        // Additional setup gos here....
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Button pressed action
    func photoButtonPressed(sender : UIButton) {
        self.presentViewController(self.alertController, animated: true, completion: nil)
    }

    //MARK: Setup autolayout constraints
    func setupConstraintsOnRootView( rootView : UIView, forViews views : [String : AnyObject] ) {
        let photoButtonsConstraintVertical = NSLayoutConstraint.constraintsWithVisualFormat( "V:[photoButton]-20-|", options: nil, metrics: nil , views: views )
        rootView.addConstraints( photoButtonsConstraintVertical )
        let photoButton = views["photoButton"] as UIView!
        let photoButtonConstraintHorizontal = NSLayoutConstraint( item: photoButton,
                                                             attribute: .CenterX ,
                                                             relatedBy: NSLayoutRelation.Equal ,
                                                                toItem: rootView,
                                                             attribute: .CenterX,
                                                            multiplier: 1.0,
                                                              constant: 1.0 )
        rootView.addConstraint( photoButtonConstraintHorizontal )
    }

}

