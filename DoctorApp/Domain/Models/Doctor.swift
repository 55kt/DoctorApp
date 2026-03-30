//
//  Doctor.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import Foundation

struct DoctorResponse: Decodable {
    let record: Record
}

struct Record: Decodable {
    let data: DoctorData
}

struct DoctorData: Decodable {
    let users: [Doctor]
}

struct Doctor: Decodable, Identifiable, Hashable {
    let id: String
    let firstName: String
    let patronymic: String
    let lastName: String
    let specialization: [Specialization]
    let ratingsRating: Double
    let seniority: Int
    let videoChatPrice: Int
    let textChatPrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let categoryLabel: String
    let higherEducation: [Education]
    let workExpirience: [WorkExperience]
    let educationTypeLabel: EducationLabel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case patronymic
        case lastName = "last_name"
        case specialization
        case ratingsRating = "ratings_rating"
        case seniority
        case videoChatPrice = "video_chat_price"
        case textChatPrice = "text_chat_price"
        case hospitalPrice = "hospital_price"
        case avatar
        case categoryLabel = "category_label"
        case higherEducation = "higher_education"
        case workExpirience = "work_expirience"
        case educationTypeLabel = "education_type_label"
    }
    
    // MARK: - Computed Properties
    
    var fullName: String {
        if patronymic.isEmpty {
            return "\(lastName)\n\(firstName)"
        }
        return "\(lastName)\n\(firstName) \(patronymic)"
    }
    
    var avatarURL: URL? {
        guard let avatar, !avatar.isEmpty else { return nil }
        return URL(string: avatar)
    }
    
    var displaySpecialization: String {
        specialization.first?.name ?? "Специалист"
    }
    
    var minPrice: Int {
        let prices = [videoChatPrice, textChatPrice, hospitalPrice]
        return prices.filter { $0 > 0 }.min() ?? 0
    }
    
    var displayPrice: String {
        minPrice > 0 ? "от \(minPrice) ₽" : "Цена не указана"
    }
    
    var hasPrice: Bool {
        minPrice > 0
    }
    
    var displaySeniority: String {
        seniority > 0 ? "Опыт работы: \(seniority) лет" : "Опыт не указан"
    }
    
    var displayCategory: String {
        categoryLabel != "нет" ? "Врач \(categoryLabel) категории" : "Категория не указана"
    }
    
    var displayEducation: String {
        if let label = educationTypeLabel {
            return label.name
        }
        return higherEducation.first?.university ?? "Образование не указано"
    }
    
    var displayWorkplace: String {
        workExpirience.first?.organization ?? "Место работы не указано"
    }
    
    var displayExperienceShort: String {
        seniority > 0 ? "\(displaySpecialization)・стаж \(seniority) лет" : displaySpecialization
    }
    
    var starCount: Int {
        min(max(Int(ratingsRating.rounded()), 0), 5)
    }
}

struct Specialization: Decodable, Hashable {
    let id: Int
    let name: String
}

struct Education: Decodable, Hashable {
    let id: Int
    let university: String
    let specialization: String
}

struct WorkExperience: Decodable, Hashable {
    let id: Int
    let organization: String
    let position: String
}

struct EducationLabel: Decodable, Hashable {
    let id: Int
    let name: String
}
