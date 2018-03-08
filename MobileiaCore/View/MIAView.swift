//
//  MIAView.swift
//  Show Prode
//
//  Created by Matias Camiletti on 4/12/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import UIKit
import PureLayout

public class MIAView: UIView {
    // Determina si ya se configuro los contraints
    var shouldSetupConstraints = true
    // Variable para tener tamaño de pantalla
    let screenSize = UIScreen.main.bounds
    // Varible que almacena el controlador
    var viewController : UIViewController!;
    
    override public required init(frame: CGRect) {
        super.init(frame: frame)
        setupViews();
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // Funcion abstracta para configurar las vistas
    public func setupViews() { }
    // Funcion abstracta para configurar los constraints
    public func setupConstraints() { }
    // Funcion para setear el controlador
    public func setViewController(_ controller: UIViewController){
        viewController = controller;
    }
    
    override public func updateConstraints() {
        // AutoLayout constraints
        if(shouldSetupConstraints) {
            // Configurar Constraints
            setupConstraints();
            // Ya se configuro
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    public class func factoryView() -> MIAView {
        return self.init(frame: CGRect.zero);
    }
}
