//
//  DataManager.swift
//  BI-IOS
//
//  Created by Dominik Vesely on 06/11/2017.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    
    
    func getRecipes( callback: @escaping (([Recipe]) -> ()))  {
        
        
        Alamofire.request("https://cookbook.ack.ee/api/v1/recipes").responseJSON { response in
         
            if let data = response.data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let recipes = try jsonDecoder.decode([Recipe].self, from: data)
                    callback(recipes)
                } catch {}
            }
        }
    }
    
    func getRecipe(id: String, callback: @escaping (RecipeDetail) -> ()) {
        Alamofire.request("https://cookbook.ack.ee/api/v1/recipes/\(id)").responseJSON { response in
            if let data = response.data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let recipe = try jsonDecoder.decode(RecipeDetail.self, from: data)
                    callback(recipe)
                } catch  {
                }
            }
        }
    }
    
}

