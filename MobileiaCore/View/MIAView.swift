//
//  MIAView.swift
//  Show Prode
//
//  Created by Matias Camiletti on 4/12/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import UIKit
import PureLayout

class MIAView: UIView {
    // Determina si ya se configuro los contraints
    var shouldSetupConstraints = true
    // Variable para tener tamaño de pantalla
    let screenSize = UIScreen.main.bounds
    // Varible que almacena el controlador
    var viewController : UIViewController!;
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setupViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // Funcion abstracta para configurar las vistas
    func setupViews() { }
    // Funcion abstracta para configurar los constraints
    func setupConstraints() { }
    // Funcion para setear el controlador
    func setViewController(_ controller: UIViewController){
        viewController = controller;
    }
    
    override func updateConstraints() {
        // AutoLayout constraints
        if(shouldSetupConstraints) {
            // Configurar Constraints
            setupConstraints();
            // Ya se configuro
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    class func factoryView() -> MIAView {
        return self.init(frame: CGRect.zero);
    }
}
