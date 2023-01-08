//
//  Utilities.swift
//  BackgroundVideo
//
//  Created by DhakaLive on 3/18/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfiled: UITextField) {
        /*Create the bottom line*/
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfiled.frame.height - 2, width: textfiled.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        /*Remove border on text field*/
        textfiled.borderStyle = .none
        
        /*Add the line to the text field*/
        textfiled.layer.addSublayer(bottomLine)
    }
    
    static func styleFieldButton(_ button: UIButton) {
        /*Filled rounded corner style*/
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button: UIButton) {
        /*Hollow rounded corner style*/
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
}
