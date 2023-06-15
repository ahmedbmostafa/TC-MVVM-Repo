//
//  CardView.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//
import UIKit

@IBDesignable
class CardView: UIView {
    
   
    var customView = UIView()

    @IBInspectable var cornerRadius:CGFloat = 10{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var topCornerRadius:CGFloat = 10{
        didSet{
            self.layer.cornerRadius = CGFloat(cornerRadius)
            self.clipsToBounds = true
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }

    
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.black  {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity:CGFloat = 0.0{
        didSet{
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable var shadowColor:UIColor = UIColor.clear  {
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowRadius:CGFloat = 0{
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffsetY:CGFloat = 0{
        didSet{
            self.layer.shadowOffset.height = shadowOffsetY
        }
    }
    
 }
