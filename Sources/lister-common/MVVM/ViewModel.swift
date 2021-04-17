//
//  ViewModel.swift
//
//  Created by 李斯特 on 2020/12/28.
//

import Combine
import Foundation

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    
    associatedtype State
    associatedtype Input
    
    // 提示信息状态
    var tipState: (status: Bool, message: String) { get set }
    var state: State { get }
    func apply(_ input: Input)
}

@available(OSX 10.15, *)
extension AnyViewModel: Identifiable where State: Identifiable {
    var id: State.ID {
        state.id
    }
}

@available(OSX 10.15, *)
@dynamicMemberLookup
final class AnyViewModel<State, Input>: ViewModel {
    
    // MARK: Stored properties
    
    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedTipState: () -> (Bool, String)
    private let syncTipState: ((Bool, String)) -> Void
    private let wrappedTrigger: (Input) -> Void
    
    // MARK: Computed properties
    
    var objectWillChange: AnyPublisher<Void, Never> {
        wrappedObjectWillChange()
    }
    
    var state: State {
        get {
            wrappedState()
        }
    }
    
    var tipState: (status: Bool, message: String)  {
        get {
            wrappedTipState()
        }
        set {
            syncTipState(newValue)
        }
    }
    
    
    // MARK: Methods
    
    func apply(_ input: Input) {
        wrappedTrigger(input)
    }
    
    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }
    
    // MARK: Initialization
    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        self.wrappedState = { viewModel.state }
        self.wrappedTrigger = viewModel.apply
        self.wrappedTipState = {viewModel.tipState}
        self.syncTipState = { (tipState) in viewModel.tipState = tipState }
    }
    
}

