//
//  bookCreationProtocol.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 20.09.2021.
//

import Foundation

protocol BookCreationProtocol {
    func createNewBook(_ book: Book)
    func updateBook(_ book: Book, _ indexPathRow: Int)
}
