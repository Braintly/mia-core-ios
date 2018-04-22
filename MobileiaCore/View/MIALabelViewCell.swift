//
//  MIALabelViewCell.swift
//  Cooperacion Seguros
//
//  Created by Matias Camiletti on 24/3/18.
//  Copyright © 2018 Cooperacion Seguros. All rights reserved.
//

import UIKit

open class MIALabelViewCell: MIATableViewCell {

    open var labelView: UILabel!;
    
    open func bindText(text: String){
        labelView.text = text;
    }
    
    open override func setupViews() {
        // Quitar seleccion
        self.selectionStyle = .none;
        // Creamos foto
        labelView = UILabel(frame:CGRect.zero);
        labelView.textColor = UIColor.black;
        labelView.font = UIFont.systemFont(ofSize: 16);
        labelView.numberOfLines = 0;
        labelView.text = "";
        self.addSubview(labelView);
    }
    
    open override func setupConstraints() {
        // Configuracion del contenedor
        labelView.autoPinEdge(toSuperviewEdge: .top, withInset: 10);
        labelView.autoPinEdge(toSuperviewEdge: .left, withInset: 10);
        labelView.autoPinEdge(toSuperviewEdge: .right, withInset: 10);
        labelView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10);
    }
    
}
