//
//  BirthdayAppTests.swift
//  BirthdayAppTests
//
//  Created by Ege Girsen on 19.07.2022.
//

import XCTest
@testable import BirthdayApp

class BirthdayAppTests: XCTestCase {

    func testPersonViewModel(){
        let name = Name(title: "Mr", first: "Ege", last: "Girsen")
        let dob = Dob(date: "1997-05-24T04:41:13.346Z", age: 25)
        let person = Results(name: name, dob: dob)
        
        let viewModel = PersonViewModel(results: person)
        XCTAssertEqual(viewModel.age, 25)
        XCTAssertEqual(viewModel.fullname, "Ege Girsen")
        XCTAssertEqual(viewModel.initials, "EG")
        XCTAssertEqual(viewModel.dob, "24/05/1997")
        
    }

}
