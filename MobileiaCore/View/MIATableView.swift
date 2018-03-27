//
//  MIATableView.swift
//  Show Prode
//
//  Created by Matias Camiletti on 5/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import UIKit

open class MIATableView: MIAView {

    // Tabla de la home
    open let tableView = UITableView();
    // Contenedor para mostrar vista vacia
    open let containerEmpty = UIView(frame:CGRect.zero);
    
    open override func setupViews(){
        // Configuramos listado Listado
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.addSubview(tableView)
        
        containerEmpty.isHidden = true;
        self.addSubview(containerEmpty);
    }
    
    open override func setupConstraints(){
        // Configurar tamaño y posición del listado
        tableView.autoPinEdge(toSuperviewEdge: .top, withInset: 0);
        tableView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0);
        tableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0);
        tableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0);
        
        containerEmpty.autoPinEdge(toSuperviewEdge: .top, withInset: 0);
        containerEmpty.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0);
        containerEmpty.autoPinEdge(toSuperviewEdge: .left, withInset: 0);
        containerEmpty.autoPinEdge(toSuperviewEdge: .right, withInset: 0);
    }
    
    open override func setViewController(_ controller: UIViewController){
        super.setViewController(controller);
        tableView.delegate = (self.viewController as! UITableViewDelegate);
        tableView.dataSource = (self.viewController as! UITableViewDataSource);
    }
    
    open func showEmptyView(){
        // Ocultar tablaa
        tableView.isHidden = true;
        // Mostrar contenedor
        containerEmpty.isHidden = false;
    }
    
    open func showTableView(){
        // Mostrar tablaa
        tableView.isHidden = false;
        // Ocultar contenedor
        containerEmpty.isHidden = true;

    }

}
