//
//  HomeView.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    HStack {
                        
                        Image(systemName: "house.fill")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 29, height: 29)
                            .background(Circle().fill(.white))
                            .padding(4)
                            .background(Circle().fill(.white.opacity(0.2)))
                        
                        Text("Home")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isChart = true
                            
                        }, label: {
                            
                            Text("USD >")
                                .foregroundColor(Color("bg"))
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 60, height: 29)
                                .background(Capsule().fill(.white))
                                .padding(4)
                                .background(Capsule().fill(.white.opacity(0.2)))
                        })
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Balance")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("$\(viewModel.balance.isEmpty ? "0" : viewModel.balance)")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                            
                            HStack(spacing: 5) {
                                
                                Text("+\(viewModel.change.isEmpty ? "0" : viewModel.change)%")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("This Month")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 14, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isEdit = true
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(Color("bg"))
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 29, height: 29)
                                .background(Circle().fill(.white))
                                .padding(4)
                                .background(Circle().fill(.white.opacity(0.2)))
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.1)))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.isAddInvest = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("invest")
                                
                                Text("Invest")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding()
                            .frame(height: 45)
                            .frame(maxWidth: .infinity)
                            .background(Capsule().fill(Color("primary")))
                        })
                        
                        Button(action: {
                            
                            viewModel.isAddPortfolio = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("project")
                                
                                Text("Add Project")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding()
                            .frame(height: 45)
                            .frame(maxWidth: .infinity)
                            .background(Capsule().fill(.white))
                        })
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.1)).ignoresSafeArea(.all, edges: .top))
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        HStack {
                            
                            Text("Portfolio")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(viewModel.portfolios.count)")
                                .foregroundColor(.gray)
                                .font(.system(size: 19, weight: .regular))
                        }
                        
                        if viewModel.portfolios.isEmpty {
                            
                            VStack(alignment: .center, spacing: 5, content: {
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                                
                                Text("You don't have any projects")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding(.vertical, 100)
                            
                        } else {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.portfolios, id: \.self) { index in
                                
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
                                        
                                        HStack {
                                            
                                            Image(systemName: "chevron.up")
                                                .foregroundColor(.white)
                                                .font(.system(size: 9, weight: .regular))
                                                .padding(6)
                                                .background(Circle().fill(.green))
                                            
                                            Text("\(index.price_change)%")
                                                .foregroundColor(.green)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("This Month")
                                                .foregroundColor(.black.opacity(0.6))
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                }
                            })
                        }
                        
                        HStack {
                            
                            Text("Transactions")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(viewModel.invests.count)")
                                .foregroundColor(.gray)
                                .font(.system(size: 19, weight: .regular))
                        }
                        
                        if viewModel.invests.isEmpty {
                            
                            VStack(alignment: .center, spacing: 5, content: {
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                                
                                Text("You don't have any transactions")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding(.vertical, 100)
                            
                        } else {
                            
                            VStack {
                                
                                ForEach(viewModel.invests, id: \.self) { index in
                                    
                                    if let project = viewModel.portfolios.first(where: {$0.full_name == index.project}) {
                                        
                                        HStack {
                                            
                                            Image(project.logo ?? "")
                                            
                                            VStack(alignment: .leading, spacing: 4, content: {
                                                
                                                Text(project.full_name ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Text(project.short_name ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                            })
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .trailing, spacing: 4, content: {
                                                
                                                Text("+$\(index.amount)")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 14, weight: .semibold))
                                                
                                                Text((index.date ?? Date()).convertDate(format: "MMM d Y HH:mm"))
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                            })
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            
            viewModel.fetchInvests()
            viewModel.fetchPortfolios()
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            HomeChart()
        })
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            HomeEdit(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddInvest, content: {
            
            HomeAddInvest(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddPortfolio, content: {
            
            HomeAddProject(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
