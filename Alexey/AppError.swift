//
//  AppError.swift
//  Alexey
//
//  Created by Сергей Полозов on 22.01.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

enum DeserializerError: Error {
    case expectedJSONObject
}

enum MapperError: Error {
    case valueMissing(for: String)
    case typeMismatch(for: String, expected: Any.Type, got: Any.Type)
}
