//
//  ViewController.swift
//  oinori
//
//  Created by yodaaa on 2019/06/16.
//  Copyright © 2019 yodaaa. All rights reserved.
//

import UIKit
import UserNotifications
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
        
        let content = UNMutableNotificationContent()
        content.title = "株式会社〇〇"
        content.subtitle = "選考結果のお知らせ" // 新登場！
        content.body = "××採用担当××でございます。この度は、××の採用にご興味をお持ちいただきまして誠に有難うございました。"
        content.sound = UNNotificationSound.default
        
        // 5秒後に発火
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond",
                                            content: content,
                                            trigger: trigger)
        
        // ローカル通知予約
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        //Timer
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.timerfunc), userInfo: nil, repeats: true)
    }
    
    @objc func timerfunc(){
        let rNotify = RandomNotification()
        rNotify.hit = .Large
        rNotify.randomNotification()
        
        let rNotify2 = RandomNotification(title: "株式会社cc", subtitle: "選考結果のお知らせ(最終)", body: "先日はありがとうございました。")
        rNotify2.randomNotification()
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

