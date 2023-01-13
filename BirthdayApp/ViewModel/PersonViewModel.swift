//
//  PersonViewModel.swift
//  BirthdayApp
//
//  Created by Ege Girsen on 19.07.2022.
//

import Foundation

struct PersonViewModel{
    
    let fullname: String
    let name: String
    let dob: String
    let age: Int
    let initials: String
    
    
    init(results: Results){
        self.fullname = results.name.first + " " + results.name.last
        self.name = results.name.first
        //self.dob = results.dob.date
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = formatter.date(from: results.dob.date) {
            formatter.dateFormat = "dd/MM/yyyy"
            self.dob = formatter.string(from: date)
        }else{
            self.dob = ""
        }

        self.age = results.dob.age
        self.initials = fullname.components(separatedBy: " ").map { String($0.prefix(1))}.joined()
    }
}
