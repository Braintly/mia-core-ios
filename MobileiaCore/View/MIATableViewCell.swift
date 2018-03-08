//
//  MIATableViewCell.swift
//  Show Prode
//
//  Created by Matias Camiletti on 5/12/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import UIKit

public class MIATableViewCell: UITableViewCell {
    // Determina si ya se configuro los contraints
    var shouldSetupConstraints = true
    // Variable para tener tamaño de pantalla
    let screenSize = UIScreen.main.bounds
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupViews();
    }
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews();
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews();
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
    // Funcion abstracta para configurar las vistas
    public func setupViews() { }
    // Funcion abstracta para configurar los constraints
    public func setupConstraints() { }

}
