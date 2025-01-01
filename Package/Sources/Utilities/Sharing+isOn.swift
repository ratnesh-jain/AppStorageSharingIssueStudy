//
//  File.swift
//  Package
//
//  Created by Ratnesh Jain on 02/01/25.
//

import Foundation
import Sharing

extension UserDefaults {
    public static var appGroup: UserDefaults {
        guard let group = UserDefaults(suiteName: "group.com.ratnesh.AppStorageSharingIssueStudy") else {
            fatalError()
        }
        return group
    }
}

extension SharedKey where Self == AppStorageKey<Bool>.Default {
    public static var isOnAppGroup: Self {
        Self[.appStorage("isOnAppGroup", store: .appGroup), default: false]
    }
    public static var isOn: Self {
        Self[.appStorage("isOn"), default: false]
    }
}
