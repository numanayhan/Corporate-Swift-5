//
//  Launch.swift
//  Label
//
//  Created by HRD on 6.12.2021.
//  Copyright © 2021 @ HR Dijital. All rights reserved.


import UIKit
import TinyConstraints
class Launch: UIViewController {
    
    lazy var logo : UILabel = {
        let label = UILabel()
        label.text = "Corporate App"
        label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: .none)
        label.textAlignment = NSTextAlignment.center
        label.textColor = .white
        return label
    }()
    
    weak var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
    }
    func setLayout(){
        view.backgroundColor = .white
//        logo.centerInSuperview()
//        view.addSubview(logo)
//        logo.width(view.frame.width)
//        logo.height(90)
//
    }
     
}
