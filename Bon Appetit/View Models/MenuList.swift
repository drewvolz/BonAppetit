//
//  MenuList.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import Combine
import SwiftUI

final class MenuListViewModel: ObservableObject {
    @Published private(set) var menuListResponse: MenuResponse?

    private var menuListCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        menuListCancellable?.cancel()
    }

    func fetch(cafeId: String) {
        var urlComponents = URLComponents(string: Urls.api.menus)!

        urlComponents.queryItems = [
            URLQueryItem(name: "cafe", value: cafeId),
            URLQueryItem(name: "json", value: "true"),
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let publisher = URLSession.shared.dataTaskPublisher(for: request)

//        menuListCancellable = publisher.sink(
//            receiveCompletion: { completion in
//                switch completion {
//                case let .failure(error):
//                    print(error)
//                case .finished:
//                    print("Success")
//                }
//            },
//            receiveValue: { value in
//                let decoder = JSONDecoder()
//
//                do {
//                    let menuListResponse = try decoder.decode(MenuResponse.self, from: value.data)
//                    self.menuListResponse = menuListResponse
//                } catch {
//                    print(error)
//                }
//            }
//        )
        
        menuListCancellable = publisher
            .map { $0.data }
            .decode(type: MenuResponse.self, decoder: JSONDecoder())
            .map { $0 }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .assign(to: \.menuListResponse, on: self)
    }
}
