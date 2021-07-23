//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Soumyattam Dey on 21/07/21.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var habits=Habits()
    @State private var showingHabitView=false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(habits.items){ item in
                    NavigationLink(destination: HabitDetailsView(habit: item)){
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("\(item.streak) days")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    habits.items.remove(atOffsets: indexSet)
                })
                
            }
            .navigationBarTitle("Habit Tracker")
            .sheet(isPresented: $showingHabitView){
                HabitView(habit:habits)
            }
            .navigationBarItems(trailing: HStack{
                Button(action: {
                    showingHabitView=true
                }, label: {
                    Image(systemName: "plus")
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
