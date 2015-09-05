//
//  ViewController.swift
//  Circle
//
//  Created by Shuangshuang Zhao on 2015-09-04.
//  Copyright (c) 2015 Shuangshuang Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var myView = UIView()
        var myView2 = UIView()
        
        
        var myImage = UIImage(named: "2.jpg")
        var myImageView = UIImageView(image: myImage)
        myImageView.frame = self.view.frame
        myImageView.clipsToBounds = true
        self.view.addSubview(myImageView)
        
        
        
        //blur effect on background
        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        
        
        myView.frame = CGRect(x: 0, y: 0, width:150 , height: 150)
        myView.center = self.view.center
        view.addSubview(myView)
        
        
        myView2.frame = CGRect(x: 0, y: 0, width:150 , height: 150)
        myView2.center = self.view.center
        view.addSubview(myView2)
        myView.backgroundColor = UIColor.clearColor()
        
        

        // making the quater of the circle
        var myLayer = CAShapeLayer()
        myLayer.path = UIBezierPath(arcCenter: CGPoint(x: myView.bounds.midX, y: myView.bounds.midY), radius: myView.frame.width/2, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true).CGPath
        myLayer.lineCap = kCALineCapRound
        myLayer.lineWidth = 8
        myLayer.strokeStart = 0
        myLayer.strokeEnd = 0.25
        myLayer.strokeColor = UIColor.whiteColor().CGColor
        myLayer.fillColor = UIColor.clearColor().CGColor
        myView.layer.addSublayer(myLayer)
        
        
        //making another circle
        myView2.backgroundColor = UIColor.clearColor()
        var myLayer2 = CAShapeLayer()
        myLayer2.path = UIBezierPath(arcCenter: CGPoint(x: myView2.bounds.midX, y: myView2.bounds.midY), radius: myView2.frame.width/2 - 20, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true).CGPath
        myLayer2.lineCap = kCALineCapRound
        myLayer2.lineWidth = 8
        myLayer2.strokeStart = 0.25
        myLayer2.strokeEnd = 0.75
        myLayer2.strokeColor = UIColor.whiteColor().CGColor
        myLayer2.fillColor = UIColor.clearColor().CGColor
        myView2.layer.addSublayer(myLayer2)
        
        //animation for the inner circle
        let rotateAnimation2 = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation2.fromValue = 0.0
        rotateAnimation2.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation2.duration = 1
        rotateAnimation2.repeatCount = Float.infinity
        myView2.layer.addAnimation(rotateAnimation2, forKey: nil)

        
        //add the UIlable
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.center = self.view.center
        label.textAlignment = NSTextAlignment.Center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Loading..."
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
        

        
        // animation of the outer circle
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(-M_PI * 2.0)
        rotateAnimation.duration = 3
        rotateAnimation.repeatCount = Float.infinity
        myView.layer.addAnimation(rotateAnimation, forKey: nil)

        

    }


}

