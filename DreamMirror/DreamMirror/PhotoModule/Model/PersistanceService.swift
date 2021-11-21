//
//  PersistanceService.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 18.11.2021.
//

import Foundation

protocol PersistanceServiceProtocol {
    func getPhotos(completion: @escaping (Result<[PhotoModel]?, Error>) -> Void)
}

class CoreDataManager: PersistanceServiceProtocol {
    func getPhotos(completion: @escaping (Result<[PhotoModel]?, Error>) -> Void) {
        
        completion(.success([
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
            PhotoModel(photoUrl: "1", photoDate: .now),
            PhotoModel(photoUrl: "2", photoDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!),
            PhotoModel(photoUrl: "3", photoDate: Calendar.current.date(byAdding: .day, value: -4, to: .now)!),
        ]))
    }
}
