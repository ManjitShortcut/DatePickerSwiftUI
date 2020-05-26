//
//  SwiftUIView.swift
//  DatePickerSwiftUI
//
//  Created by Manjit on 26/05/2020.
//  Copyright © 2020 DatePickerSwiftUI. All rights reserved.
//

import SwiftUI

struct CustomDatePicker: UIViewRepresentable {
    @Binding var selection: Date
    let minuteInterval: Int
    let displayedComponents: DatePickerComponents
    let hello:String
    func makeUIView(context: UIViewRepresentableContext<CustomDatePicker>) -> UIDatePicker {
        let picker = UIDatePicker()
        // listen to changes coming from the date picker, and use them to update the state variable
        picker.addTarget(context.coordinator,action: #selector(Coordinator.dateChanged), for: .valueChanged)
        return picker
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
    func updateUIView(_ picker: UIDatePicker, context: UIViewRepresentableContext<CustomDatePicker>) {
        picker.minuteInterval = minuteInterval
        picker.date = selection
        switch displayedComponents {
        case .hourAndMinute:
            picker.datePickerMode = .time
        case .date:
            picker.datePickerMode = .date
        case [.hourAndMinute, .date]:
            picker.datePickerMode = .dateAndTime
        default:
            break
        }
    }
    class Coordinator {
        let datePicker: CustomDatePicker
        init(picker: CustomDatePicker) {
            datePicker = picker
        }
        @objc func dateChanged(_ sender: UIDatePicker) {
                datePicker.selection = sender.date
        }
    }

}

