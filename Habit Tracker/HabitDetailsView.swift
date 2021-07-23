//
//  HabitDetailsView.swift
//  Habit Tracker
//
//  Created by Soumyattam Dey on 21/07/21.
//

import SwiftUI

struct HabitDetailsView: View {
   
    
    var habit : HabitItem

    
    var body: some View {
        
        Form{
            Text(habit.name)
            Text("\(habit.streak) days")
            Section(header:Text("Description")){
                Text(habit.description)
            }
            
        }
        
    }
    
}

