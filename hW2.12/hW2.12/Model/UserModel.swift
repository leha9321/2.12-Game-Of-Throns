//
//  UserModel.swift
//  hW2.12
//
//  Created by Алексей Трофимов on 12.12.2021.
//


struct UserModel: Decodable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let title: String?
    let family: String?
    let imageUrl: String?
}
