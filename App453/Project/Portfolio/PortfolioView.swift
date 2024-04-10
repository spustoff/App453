//
//  PortfolioView.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct PortfolioView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    HStack {
                        
                        Image(systemName: "bag")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 29, height: 29)
                            .background(Circle().fill(.white))
                            .padding(4)
                            .background(Circle().fill(.white.opacity(0.2)))
                        
                        Text("Your Assets")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isAddPortfolio = true
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("bg"))
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 60, height: 29)
                                .background(Capsule().fill(.white))
                                .padding(4)
                                .background(Capsule().fill(.white.opacity(0.2)))
                        })
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            HStack(content: {
                                
                                Image("project")
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                
                                Text("Projects")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Text("\(viewModel.portfolios.count)")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            HStack(content: {
                                
                                Image("invest")
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                
                                Text("Earning One")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Text("\(viewModel.invests.count)")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.1)).ignoresSafeArea(.all, edges: .top))
                .padding(.horizontal)
                
                if viewModel.portfolios.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("You don't have any projects")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.portfolios, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 20, content: {
                                        
                                        HStack(content: {
                                            
                                            Image(index.logo ?? "")
                                            
                                            VStack(alignment: .leading, spacing: 4, content: {
                                                
                                                Text(index.short_name ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Text(index.full_name ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                            })
                                        })
                                        
                                        Text("$\(index.price)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 19, weight: .semibold))
                                    })
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4, content: {
                                        
                                        HStack {
                                            
                                            Image(systemName: "chevron.up")
                                                .foregroundColor(.white)
                                                .font(.system(size: 9, weight: .regular))
                                                .padding(6)
                                                .background(Circle().fill(.green))
                                            
                                            Text("\(index.price_change)%")
                                                .foregroundColor(.green)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        
                                        Text("This Month")
                                            .foregroundColor(.black.opacity(0.6))
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchInvests()
            viewModel.fetchPortfolios()
        }
        .sheet(isPresented: $viewModel.isAddPortfolio, content: {
            
            HomeAddProject(viewModel: viewModel)
        })
    }
}

#Preview {
    PortfolioView()
}
