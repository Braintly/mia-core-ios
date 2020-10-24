//
//  MIATableView.swift
//  Show Prode
//
//  Created by Matias Camiletti on 5/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import UIKit

public protocol MIATableRefreshDelegate {
    func tableViewResfresh(_ tableView: UITableView);
}

open class MIATableView: MIAView {

    // Tabla de la home
    public let tableView = UITableView();
    // Contenedor para mostrar vista vacia
    public let containerEmpty = UIView(frame:CGRect.zero);
    // Loading para refrescar cuando se hace pull down
    public let refreshControl = UIRefreshControl();
    // Delegate para cuando refresca la lista
    open var refreshDelegate : MIATableRefreshDelegate?;
    
    open override func setupViews(){
        // Configuramos listado Listado
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.addSubview(tableView)
        
        containerEmpty.isHidden = true;
        self.addSubview(containerEmpty);
    }
    
    @objc func refreshTableView(_ sender: Any){
        if(self.refreshDelegate != nil){
            self.refreshDelegate?.tableViewResfresh(self.tableView);
        }
    }
    
    open func setRefreshDelegate(_ delegate : MIATableRefreshDelegate){
        self.refreshDelegate = delegate;
        // Configurar loading
        setupRefreshControl();
    }
    
    open func stopRefresh(){
        self.refreshControl.endRefreshing()
        //self.activityIndicatorView.stopAnimating()
    }
    
    open func setupRefreshControl(){
        // Agregar loading a la tabla
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl;
        } else {
            tableView.addSubview(refreshControl);
        }
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshTableView(_:)), for: .valueChanged);
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
