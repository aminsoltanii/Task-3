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
        
        
        
    }

    @objc func touchedScreen(touch: UITapGestureRecognizer) {
        
        let touchPoint = touch.location(in: self.view)
    }
    
}

