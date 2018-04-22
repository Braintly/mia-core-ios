//
//  MIACollectionViewCell.swift
//  Show Prode
//
//  Created by Matias Camiletti on 12/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import Foundation
import UIKit

open class MIACollectionViewCell: UICollectionViewCell {
    // Determina si ya se configuro los contraints
    open var shouldSetupConstraints = true
    // Variable para tener tamaño de pantalla
    open let screenSize = UIScreen.main.bounds
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupViews();
    }
    
    /*public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews();
    }*/
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews();
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
    
    // Funcion abstracta para configurar las vistas
    open func setupViews() { }
    // Funcion abstracta para configurar los constraints
    open func setupConstraints() { }
    
}
