//
//  NextViewController.swift
//  ThemeManager
//
//  Created by Thomas on 2023/9/16.
//

import UIKit

class NextViewController: UIViewController,Themed {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.shared.subscribe(self)
        
        self.view.backgroundColor = ThemeManager.shared.theme.navColor
    }
    
    func applyTheme(_ theme: ThemeProtocol) {
        self.view.backgroundColor = ThemeManager.shared.theme.navColor
    }
    
}
