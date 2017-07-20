//
//  MaterialCard.swift
//  UIPopupDatePicker
//
//  Created by James Kauten on 7/20/17.
//  Copyright © 2017 CK Software. All rights reserved.
//

/// This class models a Material design card with a background shadow
@IBDesignable open class MaterialCard: UIView {
    
    /// the radius for the corners of the card
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            addShadow()
        }
    }
    
    /// Initialize with the given frame
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    /// Initialzie with the given decoder
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// Add a shadow to the material card
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowOpacity = 0.5
    }
    
    /// Perform global initialization between init functions
    private func setup() {
        layer.cornerRadius = 4
        layer.masksToBounds = true
        clipsToBounds = true
        addShadow()
    }
    
}
