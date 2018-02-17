//
//  GuideNinja.swift
//
//  Created by Alfredo Uzumaki on 11/22/1396 AP.
//  Copyright © 1396 AP GCO. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //   laptop number keypad position
    //     789
    //     456
    //     123
    
    enum guidePoint { // divided screen to above numbers
        case i1
        case i2
        case i3
        case i4
        case i5
        case i6
        case i7
        case i8
        case i9
    }
    
    func guideNinja(finger:UIImage = #imageLiteral(resourceName: "icons8-one_finger_filled"), start:guidePoint = .i9, end:guidePoint = .i6, fingerSize:CGFloat = 40, color:UIColor = UIColor.green) {
        var startPosition = CGPoint(x:0, y:0)
        switch start {
        case .i1:
            startPosition = CGPoint(x: view.bounds.width / 5, y: view.bounds.height / 1.1)
        case .i2:
            startPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 1.1)
        case .i3:
            startPosition = CGPoint(x: view.bounds.width / 1.1, y: view.bounds.height / 1.1)
        case .i4:
            startPosition = CGPoint(x: view.bounds.width / 5, y: view.bounds.height / 2)
        case .i5:
            startPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        case .i6:
            startPosition = CGPoint(x: view.bounds.width / 1.1, y: view.bounds.height / 2)
        case .i7:
            startPosition = CGPoint(x: view.bounds.width / 5, y: view.bounds.height / 5)
        case .i8:
            startPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 5)
        case .i9:
            startPosition = CGPoint(x: view.bounds.width / 1.1, y: view.bounds.height / 5)
        }
        
        var endPosition = CGPoint(x:0, y:0)
        switch end {
        case .i1:
            endPosition = CGPoint(x: view.bounds.width / 5, y: view.bounds.height / 1.1)
        case .i2:
            endPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 1.1)
        case .i3:
            endPosition = CGPoint(x: view.bounds.width / 1.1, y: view.bounds.height / 1.1)
        case .i4:
            endPosition = CGPoint(x: view.bounds.width / 5, y: view.bounds.height / 2)
        case .i5:
            endPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        case .i6:
            endPosition = CGPoint(x: view.bounds.width / 1.1, y: view.bounds.height / 2)
        case .i7:
            endPosition = CGPoint(x: view.bounds.width / 5, y: view.bounds.height / 5)
        case .i8:
            endPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 5)
        case .i9:
            endPosition = CGPoint(x: view.bounds.width / 1.1, y: view.bounds.height / 5)
        }
        let pointerView = UIImageView(frame: CGRect(x: startPosition.x, y: startPosition.y, width: fingerSize, height: fingerSize))
        pointerView.image = finger
        pointerView.alpha = 0
        pointerView.tintColor = color
        view.addSubview(pointerView)
        view.bringSubview(toFront: pointerView)
        pointerView.layer.position = startPosition
        UIView.animate(withDuration: 0.3, animations: {
            pointerView.alpha = 1
        }) { (finished) in
            if finished {
                self.moveToPoint(v: pointerView, to: endPosition)
            }
        }
    }
    
    func moveToPoint(v: UIView, to: CGPoint) {
        UIView.animate(withDuration: 1.5, animations: {
            v.layer.position = to
        }) { (finished) in
            UIView.animate(withDuration: 0.3, animations: {
                v.alpha = 0
            }) { (finished) in
                v.removeFromSuperview()
            }
        }
    }
    
    func guideNinja(finger:UIImage = #imageLiteral(resourceName: "icons8-one_finger_filled"), start:CGPoint, end:CGPoint, fingerSize:CGFloat = 30, color:UIColor = UIColor.green) {
        let pointerView = UIImageView(frame: CGRect(x: start.x, y: start.y, width: fingerSize, height: fingerSize))
        pointerView.image = finger
        pointerView.alpha = 0
        pointerView.tintColor = color
        view.addSubview(pointerView)
        view.bringSubview(toFront: pointerView)
        pointerView.layer.position = start
        UIView.animate(withDuration: 0.3, animations: {
            pointerView.alpha = 1
        }) { (finished) in
            if finished {
                self.moveToPoint(v: pointerView, to: end)
            }
        }
    }
    
    func guideNinja(finger:UIImage = #imageLiteral(resourceName: "icons8-one_finger_filled"), tapPosition: CGPoint) {
        let pointerView = UIImageView(frame: CGRect(x: tapPosition.x, y: tapPosition.y, width: 30, height: 30))
        pointerView.image = finger
        pointerView.alpha = 0
        pointerView.tintColor = UIColor.green
        view.addSubview(pointerView)
        view.bringSubview(toFront: pointerView)
        UIView.animate(withDuration: 0.3, animations: {
            pointerView.alpha = 1
        }) { (finished) in
            if finished {
                for i in 0...3 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(i / 6), execute: {
                        let circle = UIView(frame: CGRect(x: tapPosition.x, y:tapPosition.y , width:20, height:20))
                        circle.backgroundColor = UIColor.white
                        circle.alpha = 0.9
                        circle.layer.cornerRadius = circle.bounds.width / 2
                        self.view.addSubview(circle)
                        self.view.bringSubview(toFront: pointerView)
                        UIView.animate(withDuration: 2, animations: {
                            circle.alpha = 0
                            let size = 4 * Double(i) * Double(circle.bounds.width)
                            circle.layer.frame.size = CGSize(width: size, height: size)
                            circle.center = tapPosition
                            circle.layer.cornerRadius = circle.bounds.width / 2
                        }, completion: { (finished) in
                            circle.removeFromSuperview()
                            pointerView.removeFromSuperview()
                        })
                    })
                }
            }
        }
    }
    
  func guideNinja(removeLeftOvers:Bool = true) {
        for i in 0..<self.view.subviews.count {
            if self.view.subviews[i].tag == 999 {
                self.view.subviews[i].removeFromSuperview()
                return
            }
        }
    }
}
