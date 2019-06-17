//
//  ViewController.swift
//  oinori
//
//  Created by yodaaa on 2019/06/16.
//  Copyright © 2019 yodaaa. All rights reserved.
//

import UIKit
import RAMPaperSwitch

class ViewController: UIViewController {

    @IBOutlet weak var omedetoView: UIView!
    @IBOutlet weak var oinoriView: UIView!
    @IBOutlet weak var omedetoSwitch: RAMPaperSwitch!
    @IBOutlet weak var oinoriSwitch: RAMPaperSwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipeOmedeto = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(sender:)))
        rightSwipeOmedeto.direction = .right
        rightSwipeOmedeto.name = "Ome"
        omedetoView.addGestureRecognizer(rightSwipeOmedeto)
        
        let rightSwipeOinori = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(sender:)))
        rightSwipeOinori.direction = .right
        rightSwipeOinori.name = "Oi"
        oinoriView.addGestureRecognizer(rightSwipeOinori)
        
        let leftSwipeOmedeto = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(sender:)))
        leftSwipeOmedeto.direction = .left
        leftSwipeOmedeto.name = "Ome"
        omedetoView.addGestureRecognizer(leftSwipeOmedeto)
        
        let leftSwipeOinori = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(sender:)))
        leftSwipeOinori.direction = .left
        leftSwipeOinori.name = "Oi"
        oinoriView.addGestureRecognizer(leftSwipeOinori)
    }

    @objc final func didSwipe(sender: UISwipeGestureRecognizer) {
        
        if  let name = sender.name {
            if name == "Ome" {
                if sender.direction == .right {
                    omedetoSwitch.setOn(true, animated: true)
                    //print("OmeRight")
                } else if sender.direction == .left {
                    omedetoSwitch.setOn(false, animated: true)
                    //print("OmeLeft")
                }
            } else if name == "Oi" {
                if sender.direction == .right {
                    oinoriSwitch.setOn(true, animated: true)
                    //print("OiRight")
                } else if sender.direction == .left {
                    oinoriSwitch.setOn(false, animated: true)
                    //print("OiLeft")
                }
            }
        }
    }
}

