//
//  Result.swift
//  Alexey
//
//  Created by Сергей Полозов on 22.01.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
    
    init(attempt block: () throws -> Value) {
        do {
            self = .success(try block())
        } catch {
            self = .failure(error)
        }
    }
    
    func dematerialize() throws -> Value {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}

