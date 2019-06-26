//
//  MIAViewController.swift
//  Show Prode
//
//  Created by Matias Camiletti on 4/12/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import UIKit

open class MIAViewController<T : MIAView>: UIViewController {
    
    // Almacena la vista personalizada
    open var miaView : T!;
    // Almacena el constraint de la parte inferior de la vista
    open var constraintBottom : NSLayoutConstraint!;
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Cargamos Vista del controlador
        autoViewDidLoad();
    }
    
    open func autoViewDidLoad(){
        // Creamos vista
        miaView = T(frame: CGRect.zero);
        // Asignamos el tag por default
        miaView.tag = 1;
        // Asignamos el controlador
        miaView.setViewController(self);
        // Agregamos la vista al controlador
        self.view.addSubview(miaView)
        // AutoLayout
        miaView.autoPinEdge(toSuperviewEdge: .top, withInset: 0);
        constraintBottom = miaView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0);
        miaView.autoPinEdge(toSuperviewEdge: .left, withInset: 0);
        miaView.autoPinEdge(toSuperviewEdge: .right, withInset: 0);
        // Asignamos para que detecte cuando se abre el teclado
        setupViewResizerOnKeyboardShown();
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        // Eliminar notificacion del teclado
        removeForKeyboardNotifications();
    }
    
    // MARK: - Class Methods
    // Funcion que se encarga de generar el controlador por defecto
    open class func factoryController() -> MIAViewController {
        return self.init();
    }

    // MARK: - Keyboard Functions
    func setupViewResizerOnKeyboardShown() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShowForResizing),
                                               name: Notification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHideForResizing),
                                               name: Notification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    @objc open func keyboardWillShowForResizing(notification: Notification) {
        let info : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info.object(forKey: UIKeyboardFrameEndUserInfoKey) as AnyObject).cgRectValue.size
        
        if keyboardSize.height != 0 {
            self.constraintBottom.constant = -keyboardSize.height;
            self.miaView.layoutIfNeeded();
        }
    }
    
    @objc open func keyboardWillHideForResizing(notification: Notification) {
        self.constraintBottom.constant = 0;
        self.miaView.layoutIfNeeded();
    }
    
    open func removeForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
}
