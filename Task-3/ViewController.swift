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
        imageView.backgroundColor = .systemGreen
        
        imageView.setupHexagonView()
        
        
        
        
    }

    @objc func touchedScreen(touch: UITapGestureRecognizer) {
        
        let touchPoint = touch.location(in: self.view)
        let yChange2 = 3 * (touchPoint.y / imageView.center.y) + 1
        let yChange = touchPoint.y - imageView.center.y
        let xChange = touchPoint.x - imageView.center.x

        UIView.animate(withDuration: 1, delay: 0, options: [] , animations: {
            
            self.imageView.transform = CGAffineTransform(scaleX: 1, y: yChange2)
            self.imageView.transform = CGAffineTransform(translationX: xChange , y: yChange )
         
        })
        
    }
    
}

