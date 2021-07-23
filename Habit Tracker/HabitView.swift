//
//  HabitView.swift
//  Habit Tracker
//
//  Created by Soumyattam Dey on 21/07/21.
//

import SwiftUI

struct HabitView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var habitname=""
    @State private var description=""
    @State private var streak=0
    
    @State private var showAlert=false
    
    @ObservedObject var habit=Habits()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Habit",text: $habitname)
                        .autocapitalization(.none)
                    Picker("Number of days",selection:$streak){
                        ForEach(1..<101){
                            Text("\($0) days")
                        }
                    }
                }
                
                Section(header:Text("Add a description")){
                    TextField("Write something about your habit !",text:$description)
                }
            }
            .navigationBarTitle("Add a new habit")
            .navigationBarItems(trailing: Button(action: {
                let item=HabitItem(id: UUID(), name: habitname, description: description, streak: streak)
                habit.items.append(item)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            }))
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habit: Habits())
    }
}
