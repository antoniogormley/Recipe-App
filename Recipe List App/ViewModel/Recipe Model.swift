//
//  Recipe Model.swift
//  Recipe List App
//
//  Created by Antonio Gormley on 22/06/2021.
//

import Foundation

class RecipeModel:ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        //create instance of data service
        self.recipes = DataService.getLocalData()
        
    
    }
}
