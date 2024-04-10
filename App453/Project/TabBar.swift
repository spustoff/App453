//
//  TabBar.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.white: .gray)
                            .frame(height: 22)
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Capsule().fill(.black).opacity(selectedTab == index ? 1 : 0))
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(Capsule().fill(.white))
        .padding(.horizontal)
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Portfolio = "Portfolio"
    
    case Settings = "Settings"
}


#Preview {
    
    ContentView()
}

