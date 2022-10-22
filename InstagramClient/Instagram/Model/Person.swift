//
//  Person.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import Foundation

struct Person: Identifiable
{
    var id = UUID()
    var name: String
    var image: String
}

var PersonMock: [Person] = [Person(name: "Kris", image: "person.circle"),
                            Person(name: "May", image: "person.circle"),
                            Person(name: "Tony", image: "person.circle"),
                            Person(name: "Doris", image: "person.circle"),
                            Person(name: "Kenny", image: "person.circle"),
                            Person(name: "Troy", image: "person.circle")]
