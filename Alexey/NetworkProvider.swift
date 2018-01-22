//
//  NetworkProvider.swift
//  Alexey
//
//  Created by Сергей Полозов on 22.01.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation
import Alamofire

class NetworProvider {

    // MARK: - Properties

    private var numberOfGame: String
    private let host: String = "https://api-2445582011268.apicast.io/games/"
    private let headers: HTTPHeaders = ["user-key" : "49976a37414baae061c786fad6936412"]
    private let scheduler = GCDScheduler()

    // MARK: - Initialization

    init(numberOfGame: Int) {
        let numberToString = String(numberOfGame)
        self.numberOfGame = numberToString
    }

    // MARK: - Internal helpers

    func setNumberOfGame(_ number: Int) {
        let numberToString = String(number)
        self.numberOfGame = numberToString
    }

    func getGame(completion: @escaping GameResultBlock) {
        scheduler.doInBg {
            Alamofire.request(self.host + self.numberOfGame, method: .get, parameters: [:], headers: self.headers).responseJSON(completionHandler: { (json) in
                let value = json.result.value
                self.handleResult(completion: completion, value: value)
            })
        }
    }

    private func handleResult(completion: @escaping GameResultBlock, value: Any?) {
        let gameResult = Result { () -> Game in
            guard let modelDictionaryArray = value as? [ModelDictionary] else {
                throw DeserializerError.expectedJSONObject
            }
            let modelDictionary = modelDictionaryArray[0]
            let id: Int = try modelDictionary.field(for: "id")
            let name: String = try modelDictionary.field(for: "name")
            let slug: String? = modelDictionary.fieldAsNullable(for: "slug")
            let url: String? = modelDictionary.fieldAsNullable(for: "url")
            let summary: String? = modelDictionary.fieldAsNullable(for: "summary")
            let storyline: String? = modelDictionary.fieldAsNullable(for: "storyline")
            return Game(id: id, name: name, slug: slug, url: url, summary: summary, storyline: storyline)
        }
        scheduler.doOnMainThread {
            completion(gameResult)
        }
    }
}
