//
//  ActivityView.swift
//  SUI
//
//  Created by Anastasiya Omak on 03/05/2024.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let viewController = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
