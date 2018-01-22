//
//  DictionaryExtensions.swift
//  Alexey
//
//  Created by Сергей Полозов on 22.01.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {
    func field<T>(for key: Key) throws -> T {
        guard let mappedField = self[key] else {
            throw MapperError.valueMissing(for: key)
        }
        guard let mappedFieldOfType = mappedField as? T else {
            throw MapperError.typeMismatch(for: key.description, expected: T.self, got: type(of: mappedField))
        }
        return mappedFieldOfType
    }

    func fieldAsNullable<T>(for key: Key) -> T? {
        guard let mappedField = self[key] else {
            return nil
        }
        guard let mappedFieldOfType = mappedField as? T else {
            return nil
        }
        return mappedFieldOfType
    }
}
