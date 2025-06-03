//
//  Wrapper.swift
//  Articles-iOS
//
//  Created by Yara Mohamed on 02/06/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import shared

extension ArticleList {
    @MainActor
    class ArticleListWrapper: ObservableObject {
       let articleViewModel: ArticlesViewModel
        @Published var articleState: ArticleStates
        init() {
            let injector = ArticleInjector()
            articleViewModel = injector.articleViewModel
            articleState = articleViewModel.articalState.value            
        }
        func startObserving(){
            Task{
                for await article in articleViewModel.articalState{
                    self.articleState = article
                }
            }
        }
    }
}
