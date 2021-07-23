//
//  HabitItem.swift
//  Habit Tracker
//
//  Created by Soumyattam Dey on 23/07/21.
//

import Foundation


struct HabitItem: Identifiable,Codable{
    var id = UUID()
    let name: String
    let description: String
    var streak: Int
}

class Habits:ObservableObject{
    @Published var items=[HabitItem](){
        didSet{
            let encoder=JSONEncoder()
            if let encoded=try? encoder.encode(items){
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items=UserDefaults.standard.data(forKey: "Items"){
            let decoder=JSONDecoder()
            if let decoded=try? decoder.decode([HabitItem].self, from: items){
                self.items=decoded
                return
            }
        }
        items=[]
    }
}
