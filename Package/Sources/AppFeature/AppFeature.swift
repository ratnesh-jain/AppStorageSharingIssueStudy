//
//  File.swift
//  Package
//
//  Created by Ratnesh Jain on 02/01/25.
//

import ComposableArchitecture
import Foundation
import Utilities

@Reducer
public struct AppFeature {
    @ObservableState
    public struct State: Equatable {
        @Shared(.isOn) var isOn
        @Shared(.isOnAppGroup) var isOnAppGroup
    }
    
    public enum Action: Equatable {}
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
