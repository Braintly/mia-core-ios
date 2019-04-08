//
//  MIATableViewCell.swift
//  Show Prode
//
//  Created by Matias Camiletti on 5/12/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import UIKit

open class MIATableViewCell: UITableViewCell {
    // Determina si ya se configuro los contraints
    open var shouldSetupConstraints = true
    // Variable para tener tamaño de pantalla
    public let screenSize = UIScreen.main.bounds
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupViews();
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews();
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews();
    }

    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
