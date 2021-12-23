//
//  TermsRules.swift
//  Label
//
//  Created by HRD on 6.12.2021.
//  Copyright © 2021  @Corporate HRD. All rights reserved.
//

import UIKit
import ZSWTappableLabel
import SnapKit
import ZSWTaggedString
import SafariServices

class TermsRules: UIViewController,ZSWTappableLabelTapDelegate {
   
    
    let label: ZSWTappableLabel = {
        let label = ZSWTappableLabel()
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .justified
        return label
    }()
    static let URLAttributeName = NSAttributedString.Key(rawValue: "URL")
       
       enum LinkType: String {
           case Privacy = "privacy"
           case TermsOfService = "tos"
           
           var URL: Foundation.URL {
               switch self {
               case .Privacy:
                   return Foundation.URL(string: "http://google.com/search?q=privacy")!
               case .TermsOfService:
                   return Foundation.URL(string: "http://google.com/search?q=tos")!
               }
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        label.tapDelegate = self
    }
    func setLabel(){
        
       let options = ZSWTaggedStringOptions(baseAttributes: [
            .font: UIFont.preferredFont(forTextStyle: .body),
        ])
        options["link"] = .dynamic({ tagName, tagAttributes, stringAttributes in
            guard let typeString = tagAttributes["type"] as? String,
                let type = LinkType(rawValue: typeString) else {
                return [NSAttributedString.Key: AnyObject]()
            }
            
            return [
                .tappableRegion: true,
                .tappableHighlightedBackgroundColor: UIColor.lightGray,
                .tappableHighlightedForegroundColor: UIColor.white,
                .foregroundColor: UIColor.blue,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                TermsRules.URLAttributeName: type.URL
            ]
        })
        
        let string = NSLocalizedString("Please, feel free to peruse and enjoy our wonderful and alluring <link type='privacy'>Privacy Policy</link> or if you'd really like to understand what you're allowed or not allowed to do, reading our <link type='tos'>Terms of Service</link> is sure to be enlightening", comment: "")
        label.attributedText = try? ZSWTaggedString(string: string).attributedString(with: options)
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    func tappableLabel(_ tappableLabel: ZSWTappableLabel, tappedAt idx: Int, withAttributes attributes: [NSAttributedString.Key : Any] = [:]) {
        guard let URL = attributes as? URL else {
               return
           }
           
           show(SFSafariViewController(url: URL), sender: self)
       }
   
 
}
