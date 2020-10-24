//
//  MIAImageViewCell.swift
//  Cooperacion Seguros
//
//  Created by Matias Camiletti on 24/3/18.
//  Copyright © 2018 Cooperacion Seguros. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

open class MIAImageViewCell: MIATableViewCell {
    
    open var photoView: UIImageView!;
    
    open func bindImage(url: String){
        let placeholderImage = UIImage(named: "background_top_gol")!
        
        if(url.count > 0){
            photoView.af.setImage(withURL: URL(string: url)!, placeholderImage: placeholderImage);
        }else{
            photoView.image = placeholderImage;
        }
    }
    
    open func bindImageNamed(named: String){
        photoView.image = UIImage(named: named);
    }
    
    open override func setupViews() {
        // Quitar seleccion
        self.selectionStyle = .none;
        // Creamos foto
        photoView = UIImageView(frame:CGRect.zero);
        photoView.contentMode = .scaleAspectFill;
        photoView.clipsToBounds = true;
        photoView.backgroundColor = UIColor.black;
        photoView.image = UIImage(named: "background_top_gol");
        self.addSubview(photoView);
    }
    
    open override func setupConstraints() {
        // Configuracion del contenedor
        photoView.autoPinEdge(toSuperviewEdge: .top, withInset: 0);
        photoView.autoPinEdge(toSuperviewEdge: .left, withInset: 0);
        photoView.autoPinEdge(toSuperviewEdge: .right, withInset: 0);
        photoView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0);
    }
}

