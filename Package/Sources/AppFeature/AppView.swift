//
//  File.swift
//  Package
//
//  Created by Ratnesh Jain on 02/01/25.
//

import ComposableArchitecture
import Foundation
import SwiftUI

public struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>
    
    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Form {
            Text("Is On: \(store.isOn)")
            Text("Is On AppGroup: \(store.isOnAppGroup)")
            
            Button("Toggle isOn") {
                @Shared(.isOn) var isOn
                $isOn.withLock { $0.toggle() }
            }
            
            Button("Toggle isOnAppGroup") {
                @Shared(.isOnAppGroup) var isOnAppGroup
                $isOnAppGroup.withLock { $0.toggle() }
            }
        }
    }
}

#Preview {
    AppView(store: .init(initialState: .init(), reducer: {
        AppFeature()
    }))
}
