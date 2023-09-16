//
//  ViewController.swift
//  ThemeManager
//
//  Created by Kai Chi Tsao on 2023/9/16.
//

import UIKit

/**
    使用方式:
    Step1: 繼承 Themed
 
    Step2: viewDidLoad訂閱主題變化 ThemeManager.shared.subscribe(self)
    
    Step3: func applyTheme(_ theme: Theme) 配置需改變顏色的元件
 
    EX. label.textColor = ThemeManager.shared.theme.navColor
    
    改變主題色
    ThemeManager.shared.switchToTheme(.color)
 
 */


class ViewController: UIViewController{

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 訂閱主題變化
        ThemeManager.shared.subscribe(self)
        
        label.text = "Show Theme Color Label"
        
        // 原本UI黑色
        label.textColor = .black
        
        // 變成主題色(主题預設紅色)
        label.textColor = ThemeManager.shared.theme.navColor
        btn.tintColor = ThemeManager.shared.theme.navColor
  
    }
    
    @IBAction func tapBtn(_ sender: Any) {
        ThemeManager.shared.switchToTheme(.cyan)
    }
    
}


extension ViewController:Themed{
    func applyTheme(_ theme: Theme) {
        label.textColor = ThemeManager.shared.theme.navColor
    }
}
