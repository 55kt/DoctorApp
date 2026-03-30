//
//  JSONLoader.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 30/3/26.
//

import Foundation

struct JSONLoader {
    static func loadFromBundle<T: Decodable>(_ filename: String, as type: T.Type) -> T? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("Файл \(filename).json не найден в Bundle")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Ошибка декодирования: \(error)")
            return nil
        }
    }
}
