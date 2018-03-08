//
//  MIAViewController.swift
//  Show Prode
//
//  Created by Matias Camiletti on 4/12/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import UIKit

public class MIAViewController<T : MIAView>: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Cargamos Vista del controlador
        autoViewDidLoad();
    }
    
    open func autoViewDidLoad(){
        // Creamos vista
        let parent = T(frame: CGRect.zero);
        // Asignamos el controlador
        parent.setViewController(self);
        // Agregamos la vista al controlador
        self.view.addSubview(parent)
        // AutoLayout
        parent.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Class Methods
    // Funcion que se encarga de generar el controlador por defecto
    class func factoryController() -> MIAViewController {
        return self.init();
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
