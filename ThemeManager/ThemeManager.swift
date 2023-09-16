//
//  ThemeManager.swift
//  ThemeManager
//
//  Created by Kai Chi Tsao on 2023/9/16.
//

import Foundation
import UIKit

// Themed 協議用於定義任何可以應用主題的對象應該實現的方法
protocol Themed: AnyObject {
    func applyTheme(_ theme: Theme)
}

// ThemeManager 是管理應用主題的核心
class ThemeManager {
    
    // 使用單例模式，確保整個應用只有一個 ThemeManager 實例
    static let shared = ThemeManager()

    // 目前的主題。當它被設定為新值時，所有訂閱的對象都會被通知
    var theme: Theme = .red {
        didSet {
            updateSubscribers()
        }
    }
    
    // 存儲弱引用的訂閱者列表，以防止循環引用
    private var subscribers: [WeakRef<AnyObject>] = []
    
    // 允許對象訂閱主題變化
    func subscribe(_ object: AnyObject) {
        subscribers.append(WeakRef(object))
    }
    
    // 通知所有訂閱者主題已經變化
    private func updateSubscribers() {
        subscribers = subscribers.filter { $0.value != nil }
        subscribers.forEach { subscriber in
            if let themed = subscriber.value as? Themed {
                themed.applyTheme(theme)
            }
        }
    }
}



// 擴展 ThemeManager 以使用弱引用，確保不會有循環引用問題
extension ThemeManager {
    struct WeakRef<T: AnyObject> {
        weak var value: T?
        
        init(_ value: T?) {
            self.value = value
        }
    }
}


// 擴展 ThemeManager 以提供不同的主題選擇和切換方法
extension ThemeManager {
    enum ThemeType {
        case darkBlue, black, red, orange, cyan
        
        var theme: Theme {
            switch self {
            case .darkBlue: return .darkBlue
            case .black: return .black
            case .red: return .red
            case .orange: return .orange
            case .cyan: return .cyan
            }
        }
    }
    
    // 允許輕鬆切換到指定的主題。
    func switchToTheme(_ type: ThemeType) {
        self.theme = type.theme
    }
}

// Theme UI 顏色方案
struct Theme {
    var bgColor: UIColor
    var navColor: UIColor
    var navText: UIColor
    var btnColor: UIColor
    var btnColor2: UIColor
    var btnText: UIColor
    var btnSelected: UIColor
    var btnSelected2: UIColor
    var btnSelectedText: UIColor
    var text1: UIColor
    var text2: UIColor
    
    //以下 定義了幾套預設的主題顏色方案。
    // 如 darkBlue、black 等。
    
    static let darkBlue = Theme(
        bgColor: UIColor(red: 6/255, green: 69/255, blue: 128/255, alpha: 1),
        navColor: UIColor(red: 35/255, green: 81/255, blue: 148/255, alpha: 1),
        navText: .white,
        btnColor: UIColor(red: 64/255, green: 126/255, blue: 207/255, alpha: 1.0),
        btnColor2: UIColor(red: 44/255, green: 96/255, blue: 176/255, alpha: 1.0),
        btnText: .white,
        btnSelected: UIColor(red: 109/255, green: 184/255, blue: 249/255, alpha: 1.0),
        btnSelected2: UIColor(red: 38/255, green: 92/255, blue: 246/255, alpha: 1.0),
        btnSelectedText: .white,
        text1: .white,
        text2: .white
    )
    
    static let black = Theme(
        bgColor: .black,
        navColor: .darkGray,
        navText:.white,
        btnColor: UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1),
        btnColor2: UIColor(red: 97/255, green: 96/255, blue: 96/255, alpha: 1),
        btnText: .white,
        btnSelected:UIColor(red: 255/255, green: 228/255, blue: 23/255, alpha: 1),
        btnSelected2:UIColor(red: 255/255, green: 207/255, blue: 25/255, alpha: 1),
        btnSelectedText: .black,
        text1: .white,
        text2: .white
    )
    
    static let red = Theme(
        bgColor: .white,
        navColor: UIColor(red: 236/255, green: 40/255, blue: 41/255, alpha: 1),
        navText:.white,
        btnColor: UIColor(red: 255/255, green: 127/255, blue: 127/255, alpha: 1),
        btnColor2: UIColor(red: 249/255, green: 86/255, blue: 86/255, alpha: 1),
        btnText: .white,
        btnSelected:UIColor(red: 255/255, green: 208/255, blue: 208/255, alpha: 1),
        btnSelected2:UIColor(red: 255/255, green: 171/255, blue: 171/255, alpha: 1),
        btnSelectedText: .white,
        text1: .black,
        text2: UIColor(red: 236/255, green: 40/255, blue: 41/255, alpha: 1)
    )
    
    static let orange = Theme(
        bgColor: .white,
        navColor: UIColor(red: 255/255, green: 134/255, blue: 23/255, alpha: 1),
        navText:.white,
        btnColor: UIColor(red: 255/255, green: 220/255, blue: 131/255, alpha: 1),
        btnColor2: UIColor(red: 255/255, green: 180/255, blue: 0/255, alpha: 1),
        btnText: .white,
        btnSelected:UIColor(red: 255/255, green: 228/255, blue: 23/255, alpha: 1),
        btnSelected2:UIColor(red: 255/255, green: 207/255, blue: 25/255, alpha: 1),
        btnSelectedText: .black,
        text1: .black,
        text2: UIColor(red: 255/255, green: 159/255, blue: 23/255, alpha: 1)
    )
    
    static let cyan = Theme(
        bgColor: .white,
        navColor: UIColor(red: 44/255, green: 119/255, blue: 234/255, alpha: 1),
        navText:.black,
        btnColor: UIColor(red: 24/255, green: 199/255, blue: 233/255, alpha: 1),
        btnColor2: UIColor(red: 85/255, green: 112/255, blue: 245/255, alpha: 1),
        btnText: .white,
        btnSelected:UIColor(red: 147/255, green: 226/255, blue: 245/255, alpha: 1),
        btnSelected2:UIColor(red: 31/255, green: 249/255, blue: 246/255, alpha: 1),
        btnSelectedText: .black,
        text1: .black,
        text2: UIColor(red: 44/255, green: 119/255, blue: 234/255, alpha: 1)
    )
}
