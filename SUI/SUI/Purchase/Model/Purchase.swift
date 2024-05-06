//
//  Purchase.swift
//  SUI
//
//  Created by Anastasiya Omak on 05/05/2024.
//

import Foundation

/// Тариф
struct Purchase: Hashable {
    /// Количество дней
    let days: String
    /// Тип  подписки
    let type: String
    /// Длительность подписки
    let duration: String
    /// Цена подписки
    let price: Int
}
