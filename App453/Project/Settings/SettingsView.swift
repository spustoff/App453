//
//  SettingsView.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    HStack {
                        
                        Image(systemName: "gear")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 29, height: 29)
                            .background(Circle().fill(.white))
                            .padding(4)
                            .background(Circle().fill(.white.opacity(0.2)))
                        
                        Text("Settings")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.1)).ignoresSafeArea(.all, edges: .top))
                .padding([.horizontal, .bottom])
                
                Button(action: {
                    
                    guard let url = URL(string: DataManager().usagePolicy) else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    Text("Usage Policy")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding([.horizontal])
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    Text("Rate App")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding([.horizontal, .bottom])
                })
                
                Button(action: {
                    
                    CoreDataStack.shared.deleteAllData()
                    
                }, label: {
                    
                    Text("Reset Progress")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding([.horizontal])
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
