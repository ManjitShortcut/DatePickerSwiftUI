//
//  ContentView.swift
//  DatePickerSwiftUI
//
//  Created by Manjit on 26/05/2020.
//  Copyright © 2020 DatePickerSwiftUI. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selectedPreviosDate = Date()
    @State var selectedFutureDate = Date()
    @State var selectedInbetweenDate = Date()
    @State var customDate = Date()

    var closedRange: ClosedRange<Date> {
        let twoDaysAgo = Calendar.current.date(byAdding: .day, value: -20, to: Date())!
        let fiveDaysAgo = Calendar.current.date(byAdding: .day, value: 20, to: Date())!
        
        return twoDaysAgo...fiveDaysAgo
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack(alignment: .trailing) {
                    VStack {
                        Text("Date picker withe previos date active").padding()
                        DatePicker("", selection: $selectedPreviosDate,in:...Date(), displayedComponents: [.hourAndMinute,.date])
                        Text("Your selected date: \(selectedPreviosDate)").multilineTextAlignment(.center).padding()
                    }.border(Color.black, width: 2)
                        .background(Color.red)
                }.padding()
                VStack {
                    
                    VStack {
                        Text("Date picker with future  date active").padding()
                        DatePicker("", selection: $selectedFutureDate,in:Date()..., displayedComponents: [.hourAndMinute,.date])
                        Text("Your selected date: \(selectedFutureDate)").padding()
                    }.padding().border(Color.green, width: 2).background(Color.pink)
                }.padding()
                VStack {
                    VStack {
                        Text("Date picker with in between date active")
                        DatePicker("", selection: $selectedInbetweenDate,in:closedRange, displayedComponents: [.hourAndMinute,.date])
                        Text("Your selected date: \(selectedInbetweenDate)")
                    }.padding().background(Color.yellow).border(Color.green, width: 2)
                }.padding()

                VStack {
                        VStack {
                                Text("Custom Date Picker")
                            CustomDatePicker(selection: self.$customDate, minuteInterval: 30, displayedComponents: [.date,.hourAndMinute], hello: "Date Selection")
                                     Text("Your selected date: \(self.customDate)")
                                 }.padding().background(Color.purple).border(Color.green, width: 2)
                             }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
