//
//  CarViewModel.swift
//  SUI
//
//  Created by Anastasiya Omak on 03/05/2024.
//

import Foundation

final class CarViewModel: ObservableObject {
    var cars: [CarModel] = [.init(
        carImage: "C5",
        engine: "1.6 Тurbo",
        transmission: "AWD",
        model: "C5",
        price: 2189900),
                            .init(
                                carImage: "S5",
                                engine: "1.6 Тurbo",
                                transmission: "AWD",
                                model: "S5",
                                price: 1889900),
                            .init(
                                carImage: "S5GT",
                                engine: "1.6 Тurbo",
                                transmission: "AWD",
                                model: "S5 GT",
                                price: 2189900)]
    
    public func getCurrentCar(index: Int) -> CarModel {
        cars[index]
    }
}
