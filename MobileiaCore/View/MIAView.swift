//
//  MIAView.swift
//  Show Prode
//
//  Created by Matias Camiletti on 4/12/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import UIKit
import PureLayout

open class MIAView: UIView {
    // Determina si ya se configuro los contraints
    open var shouldSetupConstraints = true
    // Variable para tener tamaño de pantalla
    public let screenSize = UIScreen.main.bounds
    // Varible que almacena el controlador
    open var viewController : UIViewController!;
    
    public override required init(frame: CGRect) {
        super.init(frame: frame)
        setupViews();
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // Funcion abstracta para configurar las vistas
    open func setupViews() { }
    // Funcion abstracta para configurar los constraints
    open func setupConstraints() { }
    // Funcion para setear el controlador
    open func setViewController(_ controller: UIViewController){
        viewController = controller;
    }
    
    open override func updateConstraints() {
        // AutoLayout constraints
        if(shouldSetupConstraints) {
            // Configurar Constraints
            setupConstraints();
            // Ya se configuro
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    open class func factoryView() -> MIAView {
        return self.init(frame: CGRect.zero);
    }
}
