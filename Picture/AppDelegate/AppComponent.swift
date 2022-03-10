//
//  AppComponent.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/10.
//

import RIBs

class AppComponent : Component<EmptyDependency>{
    init(){
        super.init(dependency: EmptyComponent())
    }
}
