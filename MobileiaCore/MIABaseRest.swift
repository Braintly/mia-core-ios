//
//  MIABaseRest.swift
//  Show Prode
//
//  Created by Matias Camiletti on 11/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import Foundation
import Alamofire

open class MIABaseRest {
    
    open func post(_ path: String, parameters: Parameters){
        
    }
    
    open func execute<T>(_ path: String, method: HTTPMethod = .get, parameters: Parameters, callback: @escaping (_ object: T) -> Void, callbackError: @escaping (_ error: MIAErrorRest) -> Void) -> Void where T : Decodable {
        
        executeBase(path, type: 0, method: .post, parameters: parameters, callback: callback, callbackError: callbackError);
    }
    
    open func executeArray<T>(_ path: String, method: HTTPMethod = .get, parameters: Parameters, callback: @escaping (_ object: T) -> Void, callbackError: @escaping (_ error: MIAErrorRest) -> Void) -> Void where T : Decodable {
        
        executeBase(path, type: 1, method: method, parameters: parameters, callback: callback, callbackError: callbackError);
    }
    
    open func executePrimitive<T>(_ path: String, method: HTTPMethod = .get, parameters: Parameters, callback: @escaping (_ object: T) -> Void, callbackError: @escaping (_ error: MIAErrorRest) -> Void) -> Void where T : Decodable {
        
        executeBase(path, type: 2, method: .post, parameters: parameters, callback: callback, callbackError: callbackError);
    }
    
    open func executeBase<T>(_ path: String, type: Int = 0, method: HTTPMethod = .get, parameters: Parameters, callback: @escaping (_ object: T) -> Void, callbackError: @escaping (_ error: MIAErrorRest) -> Void) -> Void where T : Decodable {
        
        var encoding : ParameterEncoding = URLEncoding.default;
        if(method == .post){
            encoding = JSONEncoding.default;
        }

        // Ejecutamos llamada al servidor
        Alamofire.request(getBaseUrl() + path, method: method, parameters: parameters, encoding: encoding, headers: ["Accept": "application/json"]).responseJSON { (response) in
            
            // Verificamos si tuvo un error
            if response.error != nil {
                callbackError(MIAErrorRest(code: -1, message: "No se pudo conectar con el servidor o ha ocurrido un error grave." + response.error.debugDescription));
                return;
            }
            
            // Validamos como fue la respuesta
            if let json = response.result.value as? [String:Any] {
                // Verificar si es una respuesta correcta
                let success = json["success"] as! Bool;
                if(success == false){
                    //let error = json["error"] as! [String:Any];
                    //callbackError(MIAErrorRest(code: error["code"] as! Int, message: error["message"] as! String));
                    callbackError(MIAErrorRest(code: -2, message: "Problemas al parsear."));
                    return;
                }
                
                do{
                    // Convertimos json en data
                    var dataObject : Data;
                    if(type == 0){
                        dataObject = try JSONSerialization.data(withJSONObject: json["response"] as! [String:Any], options: []);
                    }else if(type == 1){
                        dataObject = try JSONSerialization.data(withJSONObject: json["response"] as! [Any], options: []);
                    }else{
                        
                        /*if(T.self == String.self){
                            callback(String(json["response"]));
                        }else{*/
                            callback(json["response"] as! T);
                        //}
                        return;
                    }
                    // Convertimos la respuesta en la entidad
                    let object = try JSONDecoder().decode(T.self, from: dataObject);
                    // Llamamos al callback
                    callback(object);
                    return;
                }catch{
                    //print("error: \(error)")
                    callbackError(MIAErrorRest(code: -2, message: "Problemas al parsear."));
                    return;
                }
            }
            
            // Llamamos al callback de error
            callbackError(MIAErrorRest(code: -3, message: "No se han podido obtener los datos."));
            
            
        }
        
    }
    
    open func getBaseUrl() -> String {
        return "";
    }
}
