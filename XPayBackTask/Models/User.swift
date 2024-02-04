//
//  User.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 31/01/24.
//


import Foundation

// MARK: - Employee
struct Users: Decodable {
    let total, skip, limit: Int
    let users: [User]
}

// MARK: - EmployeeData
struct User: Decodable, Hashable {
    let id, age, height : Int
    let weight: Double
    let firstName, lastName, maidenName: String
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let eyeColor: String
    let gender: String
    let hair: Hair
    let domain, ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: Company
    let ein, ssn, userAgent: String
    let crypto: Crypto
    
}

// MARK: - Address
struct Address: Decodable, Hashable {
    let address, city: String?
    let coordinates: Coordinates
    let postalCode, state: String
}

// MARK: - Coordinates
struct Coordinates: Decodable, Hashable {
    let lat, lng: Double
}

// MARK: - Bank
struct Bank: Decodable, Hashable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}

// MARK: - Company
struct Company: Decodable, Hashable {
    let address: Address
    let department, name, title: String
}

// MARK: - Crypto
struct Crypto: Decodable, Hashable {
    let coin: String
    let wallet: String
    let network: String
}

enum Gender: String {
    case female
    case male
}

// MARK: - Hair
struct Hair : Decodable, Hashable{
    let color, type: String
}


struct MockData {
    
    static let users = [sampleUser, sampleUser, sampleUser]
    
    static let sampleUser = User(id: 0, age: 36, height: 167, weight: 67, firstName: "asdasd", lastName: "asdasdas", maidenName: "", email: "", phone: "", username: "", password: "", birthDate: "", image: "", bloodGroup: "", eyeColor: "", gender: "Male", hair: Hair(color: "Black", type: "Strands"), domain: "", ip: "", address: Address(address: "hjhk", city: "uytuytuy", coordinates: Coordinates(lat: 12.34, lng: 34.45), postalCode: "878392", state: "Kerala"), macAddress: "", university: "", bank: Bank(cardExpire: "06/28", cardNumber: "50380955204220685", cardType: "maestro", currency: "Rupess", iban: "NO17 0695 2754 967"), company: Company(address: Address(address: "hjhk", city: "uytuytuy", coordinates: Coordinates(lat: 12.34, lng: 34.45), postalCode: "878392", state: "Kerala"), department: "Marketing", name: "Blanda-O'Keefe", title: "Help Desk Operator"), ein: "", ssn: "", userAgent: "", crypto: Crypto(coin: "Bitcoin", wallet: "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a", network: "Ethereum (ERC20)"))
}


