//
//  PersonModel.swift
//  BirthdayApp
//
//  Created by Ege Girsen on 19.07.2022.
//

import Foundation

// Rest model

struct RestResponse: Codable{
    let results: [Results]
    let info: Info
}

struct Info: Codable{
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct Results: Codable{
    let name: Name
    let dob: Dob
}

struct Name: Codable{
    let title: String
    let first: String
    let last: String
}

struct Dob: Codable{
    let date: String
    let age: Int
}

