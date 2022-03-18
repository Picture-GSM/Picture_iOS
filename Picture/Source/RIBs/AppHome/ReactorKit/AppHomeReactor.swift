//
//  AppHomeReactor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/15.
//

import ReactorKit

final class AppHomeReactor : Reactor{

    //MARK: - Event
    enum Action{
        case AddBtnClicked
    }
    enum Mutation{

    }
    struct State{

    }
    
    //MARK: - Properties
    let initialState : State

    init(){
        self.initialState = State()
    }
}

extension AppHomeReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .AddBtnClicked:
            print("Action")
            return .empty()
        }
    }
}
