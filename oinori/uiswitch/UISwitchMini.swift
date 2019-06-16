//
//  UISwitchMini.swift
//  oinori
//
//  Created by yodaaa on 2019/06/16.
//  Copyright © 2019 yodaaa. All rights reserved.
//
import UIKit

class UISwitchMini: UISwitch {
    @IBInspectable var dispSize: CGSize = CGSize(width: 51.0, height: 31.0) //iOS10での標準サイズをいれている
    override func awakeFromNib() {
        super.awakeFromNib()
        let scaleX: CGFloat = dispSize.width / self.bounds.size.width
        let scaleY: CGFloat = dispSize.height / self.bounds.size.height
        print("[bounds:\(NSCoder.string(for: self.bounds))] [frame:\(NSCoder.string(for: self.frame))]")
        self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        print("[bounds:\(NSCoder.string(for: self.bounds))] [frame:\(NSCoder.string(for: self.frame))]")
    }
}
