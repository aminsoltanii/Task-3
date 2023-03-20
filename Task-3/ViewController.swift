//
//  ViewController.swift
//  Task 3
//
//  Created by Amin Soltani on 12/20/1401 AP.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!


    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchedScreen(touch:)))
            view.addGestureRecognizer(tap)
        
        imageView.backgroundColor = .green
        

    
        imageView.layer.addSublayer(customRectangleShape())
        
        
        
    }

    @objc func touchedScreen(touch: UITapGestureRecognizer) {
        
        let touchPoint = touch.location(in: self.view)
        let yChange2 =  (touchPoint.y / imageView.center.y)
        let yChange = touchPoint.y - imageView.center.y
        let xChange = touchPoint.x - imageView.center.x
        


        UIView
            .animate(withDuration: 1,
                     animations: {
                self.imageView.transform = CGAffineTransform(translationX: xChange , y: yChange )
            },
                     completion: { _ in
                        UIView.animate(withDuration: 1,
                                       animations: {
                            self.imageView.center = touchPoint
                            self.imageView.transform = CGAffineTransform(scaleX: 1, y: yChange2)
                            
                        })
            })
        
    }
    
    func customRectangleShape() ->CALayer{
        let rectangleLayer = CALayer()
        let rectangleYStart = 0
        let rectangleXStart = 50
        let rectangleWidth = 200
        let rectangleHeight = 100
        
        rectangleLayer.frame = CGRect(x: rectangleXStart, y: rectangleYStart, width: rectangleWidth, height: rectangleHeight)
        rectangleLayer.backgroundColor = UIColor.red.cgColor
        
        let leftTriangleLayer = CAShapeLayer()
        let leftTrianglePath = UIBezierPath()
        leftTrianglePath.move(to: CGPoint(x: 0, y: 0))
        leftTrianglePath.addLine(to: CGPoint(x: 0, y: rectangleHeight))
        leftTrianglePath.addLine(to: CGPoint(x: -50, y: rectangleHeight/2))
        leftTrianglePath.close()
        leftTriangleLayer.path = leftTrianglePath.cgPath
        leftTriangleLayer.fillColor = UIColor.blue.cgColor
        
        let rightTriangleLayer = CAShapeLayer()
        let rightTrianglePath = UIBezierPath()
        rightTrianglePath.move(to: CGPoint(x: rectangleWidth, y: 0))
        rightTrianglePath.addLine(to: CGPoint(x: rectangleWidth, y: rectangleHeight))
        rightTrianglePath.addLine(to: CGPoint(x: rectangleWidth + 50, y: rectangleHeight/2))
        rightTrianglePath.close()
        rightTriangleLayer.path = rightTrianglePath.cgPath
        rightTriangleLayer.fillColor = UIColor.blue.cgColor
        
        rectangleLayer.addSublayer(leftTriangleLayer)
        rectangleLayer.addSublayer(rightTriangleLayer)
        
        return rectangleLayer
    }
    
}

