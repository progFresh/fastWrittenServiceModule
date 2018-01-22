//
//  Game.swift
//  Alexey
//
//  Created by Сергей Полозов on 22.01.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

struct Game {
    let id: Int
    let name: String
    let slug: String?
    let url: String?
    let summary: String?
    let storyline: String?

    init(id: Int, name: String, slug: String?, url: String?, summary: String?, storyline: String?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.url = url
        self.summary = summary
        self.storyline = storyline
    }
}
