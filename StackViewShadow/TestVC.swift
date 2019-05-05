//
//  TestVC.swift
//  StackViewShadow
//
//  Created by Fabio Acri on 20/03/2018.
//  Copyright © 2018 Fabio Acri. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
    
    var shadowView = ShadowView()
    
    override func loadView() {
        view = shadowView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shadow StackView"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shadowView.viewWillAppear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        shadowView.addShadow()
    }
}
