//
//  IceButton.swift
//  EngQuiz
//
//  Created by Nguyen Anh Tuan on 4/23/21.
//  Copyright © 2021 CK2021. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class IceButton : UIButton {
    var isAnswer = false
    
    private var originalBackgroundColor: UIColor!
    private var originalTextColor: UIColor!
    
    private var originalWidth: CGFloat!
    private var originalHeight: CGFloat!
    
    private let DISABLED_BACKGROUND_COLOR = UIColor.systemGray4
    private let DISABLED_TEXT_COLOR = UIColor.gray
    
    
    
    //  saving the original colors on the first time this view has moved to its parent view
    override func didMoveToSuperview() {
        originalTextColor = self.titleColor(for: .normal)
        originalBackgroundColor = self.backgroundColor
        
        originalWidth = self.layer.frame.width
        originalHeight = self.layer.frame.height
        
        //  setting initial colors if the button is disabled in the storyboard
        if !isEnabled {
            self.setTitleColor(DISABLED_TEXT_COLOR, for: .normal)
            self.backgroundColor = DISABLED_BACKGROUND_COLOR
        }
    }
    
    
    //  auto reverting the original colors when re-enabled
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                revertColors()
            }
            else {
                self.setTitleColor(DISABLED_TEXT_COLOR, for: .normal)
                self.backgroundColor = DISABLED_BACKGROUND_COLOR
            }
        }
    }
    
    public func revertColors() {
        self.setTitleColor(originalTextColor, for: .normal)
        self.backgroundColor = originalBackgroundColor
    }
    
    
    
    //  the stored property for designing rounded corner
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
    
    @IBInspectable var circled: Bool = false {
        didSet {
            if circled {
                let greaterValue = (originalWidth > originalHeight ? originalWidth : originalHeight)!
                self.layer.frame.size = CGSize(width: greaterValue, height: greaterValue)
                
                radius = greaterValue / 2
            }
            else {
                revertSizes()
            }
        }
    }
    
    private func revertSizes() {
        self.layer.frame.size = CGSize(width: originalWidth, height: originalHeight)
    }
    
}
