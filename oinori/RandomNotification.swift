//
//  RandomNotification.swift
//  oinori
//
//  Created by yodaaa on 2019/06/17.
//  Copyright © 2019 yodaaa. All rights reserved.
//

import Foundation
import UserNotifications

class RandomNotification: Any {
    enum notificationVolume {
        case Large
        case Medium
        case Small
        
        func random() -> Int{
            switch self {
            case .Large:
                return Int.random(in: 2 ... 10)
            case .Medium:
                return Int.random(in: 11 ... 20)
            case .Small:
                return Int.random(in: 21 ... 50)
            default:
                return 0
            }
        }
    }
    var hit: notificationVolume = .Small
    var title: String = "株式会社〇〇"
    var subtitle: String = "選考結果のお知らせ"
    var body: String = "××採用担当××でございます。この度は、××の採用にご興味をお持ちいただきまして誠に有難うございました。"
    
    init(title: String = "", subtitle: String = "", body: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.body = body
    }
    
    
    func randomNotification(){
        let random: Int = Int.random(in: 1 ... hit.random())
        print(random)
        if random == 1 {
            setNotification()
        }
    }
    
    private func setNotification(){
        let content = UNMutableNotificationContent()
        content.title = self.title
        content.subtitle = self.subtitle
        content.body = self.body
        content.sound = UNNotificationSound.default
        
        // 1秒後に発火
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond",
                                            content: content,
                                            trigger: trigger)
        
        // ローカル通知予約
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

