//
//  ArticleView.swift
//  Articles-iOS
//
//  Created by Yara Mohamed on 02/06/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI
import shared

struct ArticleView: View {
    var article : Article
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            AsyncImage(url: URL(string: article.urlToImage ?? " " )) { phase in
                if phase.image != nil {
                    phase.image!
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }else if phase.error != nil {
                    Text("Error")
                }else{
                    ProgressView()
                }
            }
            Text(article.title)
                .font(.title)
                .fontWeight(.bold)
            Text(article.description_ ?? " " )
            Text(article.publishedAt)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(.gray)
        }.padding()
    }
}

