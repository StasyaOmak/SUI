//
//  PurchasViewModel.swift
//  SUI
//
//  Created by Anastasiya Omak on 05/05/2024.
//

import Foundation


final class PurchaseViewModel: ObservableObject {
    private enum Constant {
        static let vacation = "Vacation"
        static let standart = "Standard"
        static let standardPlus = "Standard+"
        
        static let vacationDays = "7"
        static let standardDays = "30"
        static let standardPlusDays = "90"
        
        static let vacationDuration = "7 days"
        static let standardDuration = "1 month"
        static let standardPlusDuration = "3 months"
        
        static let vacationPrice = 99
        static let standardPrice = 179
        static let standardPlusPrice = 279
    }
    
    @Published public var selectedIndex = 3 {
        didSet {
            if selectedIndex == oldValue {
                selectedIndex = 4
            }
        }
    }
    
    public let purchases: [Purchase] = [
    Purchase(
        days: Constant.vacationDays,
        type: Constant.vacation,
        duration: Constant.vacationDuration,
        price: Constant.vacationPrice
    ),
    Purchase(
        days: Constant.standardDays,
        type: Constant.standart,
        duration: Constant.standardDuration,
        price: Constant.standardPrice
    ),
    Purchase(
        days: Constant.standardPlusDays,
        type: Constant.standardPlus,
        duration: Constant.standardPlusDuration,
        price: Constant.standardPlusPrice
    )]
}

