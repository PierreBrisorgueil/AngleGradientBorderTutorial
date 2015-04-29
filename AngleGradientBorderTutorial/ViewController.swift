//
//  ViewController.swift
//  AngleGradientBorderTutorial
//
//  Created by Ian Hirschfeld on 9/28/14.
//  Copyright (c) 2014 Ian Hirschfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI
    @IBOutlet var angleGradientBorderView1: AngleGradientBorderView!
    @IBOutlet var angleGradientBorderView2: AngleGradientBorderView!
    @IBOutlet var angleGradientBorderView3: AngleGradientBorderView!
    
    @IBOutlet weak var imgWaos1: UIImageView!
    @IBOutlet weak var imgWaos2: UIImageView!
    @IBOutlet weak var imgWaos3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imgWaos1.layer.cornerRadius = self.imgWaos1.frame.size.width / 2
        self.imgWaos1.clipsToBounds = true
        
        self.imgWaos2.layer.cornerRadius = self.imgWaos2.frame.size.width / 2
        self.imgWaos2.clipsToBounds = true
        
        self.imgWaos3.layer.cornerRadius = self.imgWaos3.frame.size.width / 2
        self.imgWaos3.clipsToBounds = true
        
        let angleGradientBorderView1Colors: [AnyObject] = [
            UIColor.redColor().CGColor,
            UIColor.orangeColor().CGColor,
            UIColor.yellowColor().CGColor,
            UIColor.greenColor().CGColor,
            UIColor.blueColor().CGColor,
            UIColor.purpleColor().CGColor,
            UIColor.magentaColor().CGColor,
            UIColor.redColor().CGColor,
        ]
        // Change the colors of angleGradientBorderView1 and its border width
        angleGradientBorderView1.setupGradientLayer(borderColors: angleGradientBorderView1Colors, borderWidth: 5)
        
        let angleGradientBorderView3Colors: [AnyObject] = [
            UIColor.redColor().CGColor,
            UIColor.orangeColor().CGColor,
            UIColor.yellowColor().CGColor,
            UIColor.greenColor().CGColor,
            UIColor.blueColor().CGColor,
            UIColor.purpleColor().CGColor,
            UIColor.magentaColor().CGColor,
            UIColor.redColor().CGColor,
        ]
        
        angleGradientBorderView2.center.x -= view.bounds.width
        
        
        // Three annimations
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            CATransaction.begin()
            CATransaction.setCompletionBlock({
                self.scaleView(self.angleGradientBorderView1, f: 1.1, t: 1, d: 0.1)
            })
            self.scaleView(self.angleGradientBorderView1, f: 0.8, t: 1.1, d: 0.15)
            CATransaction.commit()
        })
        scaleView(angleGradientBorderView1, f: 1.2, t: 0.8, d: 0.1)
        CATransaction.commit()
        // Change the colors of angleGradientBorderView1 and its border width
        angleGradientBorderView3.setupGradientLayer(borderColors: angleGradientBorderView3Colors, borderWidth: 5)
    }
    
    
    @IBAction func action2(sender: AnyObject) {
        shakeView(angleGradientBorderView2, x: 5, y: 0, d: 0.05, r: 5)
    }
    
    @IBAction func action3(sender: AnyObject) {
        rotateView(angleGradientBorderView3, f: 0, t: 2 * M_PI, d: 0.25)
    }
    
    
    func scaleView(obj: AngleGradientBorderView, f: Double, t: Double, d: Double) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = f
        animation.toValue = t
        animation.duration = d
        animation.removedOnCompletion = true
        animation.delegate = self
        animation.setValue("shrink", forKey: "animationId")
        obj.layer.addAnimation(animation, forKey: "shrink")
    }
    
    func shakeView(obj: AngleGradientBorderView, x: CGFloat, y: CGFloat, d: Double, r: Float){
        var shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = d
        shake.repeatCount = r
        shake.autoreverses = true
    
        var from_point:CGPoint = CGPointMake(self.view.center.x - x, self.view.center.y - y)
        var from_value:NSValue = NSValue(CGPoint: from_point)
        
        var to_point:CGPoint = CGPointMake(self.view.center.x + x, self.view.center.y + y)
        var to_value:NSValue = NSValue(CGPoint: to_point)

        shake.fromValue = from_value
        shake.toValue = to_value
        obj.layer.addAnimation(shake, forKey: "position")
    }
    
    func rotateView(obj: AngleGradientBorderView, f: Double, t: Double, d: Double) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = f
        animation.toValue = t
        animation.duration = d
        animation.removedOnCompletion = true
        animation.delegate = self
        animation.setValue("spin", forKey: "animationId")
        obj.layer.addAnimation(animation, forKey: "spin")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

