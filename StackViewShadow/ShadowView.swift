//
//  ShadowView.swift
//  StackViewShadow
//
//  Created by Fabio Acri on 20/03/2018.
//  Copyright © 2018 Fabio Acri. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    @IBOutlet weak var stackViewContainer: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let myView = Bundle.main.loadNibNamed("ShadowView", owner: self, options: nil)?.first as? UIView
        addSubview(myView!)
        
        myView?.backgroundColor = .white
    }
    
    func viewWillAppear() {
        _ = stackViewContainer.arrangedSubviews.compactMap {
            ($0 as? UILabel)?.preferredMaxLayoutWidth = frame.size.width - stackViewContainer.frame.origin.x * 2 - stackViewContainer.layoutMargins.right * 2
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("failed to initialise coder")
    }
    
    func addShadow() {
        
        // draw an edge view and pin it to the stack view as subview
        let edgeShadowView = UIView()
        edgeShadowView.backgroundColor = .red
        edgeShadowView.layer.cornerRadius = 5.0
        stackViewContainer.insertSubview(edgeShadowView, at: 0)
        
        // draw shape layer and insert it to the edge view, 0 index
        let shadowLayer = CAShapeLayer()
        let adjustedRect = CGRect(x: 0, y: 0,
         width: frame.size.width - stackViewContainer.frame.origin.x * 2,
         height: stackViewContainer.layoutMarginsGuide.layoutFrame.height + stackViewContainer.layoutMargins.bottom)
        shadowLayer.path = UIBezierPath(roundedRect: adjustedRect, cornerRadius: 5.0).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowRadius = 3
        edgeShadowView.layer.insertSublayer(shadowLayer, at: 0)
    }
}




