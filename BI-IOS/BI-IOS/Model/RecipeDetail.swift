//
//  RecipeDetail.swift
//  BI-IOS
//
//  Created by Karolina Solanska on 20/11/2017.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import Foundation


struct RecipeDetail : Codable{
    var name : String
    var description : String
    var duration: Int
    var ingredients: [String]
    var info : String
    var id: String
    var score: Double
}
