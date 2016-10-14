//
//  ViewController.swift
//  DTPhotoViewerController
//
//  Created by Tung Vo on 05/07/2016.
//  Copyright (c) 2016 Tung Vo. All rights reserved.
//

import UIKit
import DTPhotoViewerController

class ViewController: UIViewController {
    let topLeftView = UIImageView()
    let bottomLeftView = UIImageView()
    let topRightView = UIImageView()
    let bottomRightView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        
        self.makeLayout()
    }
    
    fileprivate let SCREEN_SIZE = UIScreen.main.bounds
    fileprivate let GAP_BETWEEN_VIEWS:CGFloat = 0.08
    
    func makeLayout() {
        
        // Create four Subviews
        topLeftView.translatesAutoresizingMaskIntoConstraints = false
        topLeftView.contentMode = UIViewContentMode.scaleAspectFit
        topLeftView.image = UIImage(named: "hero-mario.png")
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(type(of: self).imageViewTapped(_:)))
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.numberOfTouchesRequired = 1
        topLeftView.isUserInteractionEnabled = true
        topLeftView.addGestureRecognizer(tapGesture1)
        
        topRightView.translatesAutoresizingMaskIntoConstraints = false
        topRightView.image = UIImage(named: "hero-mario.png")
        topRightView.contentMode = UIViewContentMode.scaleAspectFit
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(type(of: self).imageViewTapped(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        topRightView.isUserInteractionEnabled = true
        topRightView.addGestureRecognizer(tapGesture2)
        
        bottomLeftView.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftView.image = UIImage(named: "hero-mario.png")
        bottomLeftView.contentMode = UIViewContentMode.scaleAspectFit
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(type(of: self).imageViewTapped(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1
        bottomLeftView.isUserInteractionEnabled = true
        bottomLeftView.addGestureRecognizer(tapGesture3)
        
        bottomRightView.translatesAutoresizingMaskIntoConstraints = false
        bottomRightView.image = UIImage(named: "hero-mario.png")
        bottomRightView.contentMode = UIViewContentMode.scaleAspectFit
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(type(of: self).imageViewTapped(_:)))
        tapGesture4.numberOfTapsRequired = 1
        tapGesture4.numberOfTouchesRequired = 1
        bottomRightView.isUserInteractionEnabled = true
        bottomRightView.addGestureRecognizer(tapGesture4)
        
        self.view.addSubview(topLeftView)
        self.view.addSubview(topRightView)
        self.view.addSubview(bottomLeftView)
        self.view.addSubview(bottomRightView)
        
        self.addConstraints()
    }
    
    func addConstraints() {
        self.addTopRightViewConstraints()
        self.addTopLeftViewConstraints()
        self.addBottomLeftViewConstraints()
        self.addBottomRightViewConstraints()
        self.addSpacingConstraints()
        self.addEqualConstraints()
    }
    
    func addTopRightViewConstraints() {
        let topRightViewTrailingConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        
        let topRightViewTopConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal
            , toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topRightViewTrailingConstraint, topRightViewTopConstraint])
    }
    
    func addTopLeftViewConstraints() {
        let topLeftLeadingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        
        let topLeftTopLeadingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topLeftLeadingConstraints, topLeftTopLeadingConstraints])
    }
    
    func addBottomLeftViewConstraints() {
        
        let bottomLeftViewLeadingConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal
            , toItem: view, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        
        let bottomLeftViewBottomConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal
            , toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([bottomLeftViewLeadingConstraint, bottomLeftViewBottomConstraint])
        
    }
    
    func addBottomRightViewConstraints() {
        let bottomRightViewTrailingConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal
            , toItem: view, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        
        let bottomRightViewBottomConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal
            , toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([bottomRightViewTrailingConstraint, bottomRightViewBottomConstraint])
    }
    
    func addSpacingConstraints() {
        let topHorizontalSpacingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: topRightView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        let bottomHorizontalSpacingConstraints = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: bottomRightView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        let leftVerticalSpacingConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        let rightVerticalSpacingConstraints = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: bottomRightView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: -GAP_BETWEEN_VIEWS * SCREEN_SIZE.height)
        
        NSLayoutConstraint.activate([topHorizontalSpacingConstraints, bottomHorizontalSpacingConstraints, leftVerticalSpacingConstraints, rightVerticalSpacingConstraints])
    }
    
    func addEqualConstraints() {
        let topEqualWidthConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: topRightView, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)
        
        let topEqualHeightConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: topRightView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)
        
        let leftEqualHeightConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)
        
        let leftEqualWidthConstraints = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topEqualHeightConstraints, leftEqualHeightConstraints, topEqualWidthConstraints, leftEqualWidthConstraints])
    }
    
    func imageViewTapped(_ recognizer: UITapGestureRecognizer) {
        if let imageView = recognizer.view as? UIImageView {
            if let photoViewerController = DTPhotoViewerController(referenceView: imageView, image: imageView.image) {
                self.present(photoViewerController, animated: true, completion: nil)
            }
        }
    }
    
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .all
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

