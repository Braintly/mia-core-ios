//
//  MIABaseRealm.swift
//  Show Prode
//
//  Created by Matias Camiletti on 11/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import Foundation
import RealmSwift

open class MIABaseRealm {
    
    public init(){}
    
    open func save(entity: Object){
        let realm = getRealm();
        try! realm.write {
            realm.add(entity)
        }
    }
    
    open func saveOrUpdate(_ entity: Object){
        // Get the default Realm
        let realm = getRealm();
        // Iniciamos transacción
        try! realm.write {
            // Guardamos el objeto
            realm.add(entity, update: true);
        }
    }
    // Funcion que guarda un listado de objetos
    open func saveAll(_ list : Array<Object>) {
        // Get the default Realm
        let realm = getRealm();
        // Iniciamos transacción
        try! realm.write {
            // Guardamos los objetos
            realm.add(list, update: true);
        }
    }
    
    open func delete(entity: Object){
        let realm = getRealm();
        try! realm.write {
            realm.delete(entity)
        }
    }
    
    open func deleteAll(){
        // Get the default Realm
        let realm = getRealm();
        // Delete all objects from the realm
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    open func getRealm() -> Realm {
        var config = Realm.Configuration(
            // Get the URL to the bundled file
            //fileURL: Bundle.main.url(forResource: getNameFile(), withExtension: "realm"),
            // Open the file in read-only mode as application bundles are not writeable
            //readOnly: true
            objectTypes: getObjectTypes()
        )
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent(getNameFile() + ".realm")
        // Open the Realm with the configuration
        return try! Realm(configuration: config);
    }
    
    open func getNameFile() -> String{
        return "default_ream";
    }
    
    open func getObjectTypes() -> [Object.Type]{
        return [];
    }
}
