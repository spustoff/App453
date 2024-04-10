//
//  HomeAddInvest.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct HomeAddInvest: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 40, height: 4)
                        .padding(.top, 4)
                    
                    ZStack {
                        
                        Text("Invest")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                        
                        HStack {
                            
                            Button(action: {
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 10, weight: .medium))
                                    .frame(width: 23, height: 23)
                                    .background(Circle().fill(.gray.opacity(0.2)))
                            })
                            
                            Spacer()
                        }
                    }
                    .padding([.horizontal, .top])
                    
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(height: 1)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 25) {
                        
                        Menu {
                            
                            ForEach(viewModel.portfolios, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.invest_project = index.full_name ?? ""
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index.full_name ?? "")
                                        
                                        Spacer()
                                        
                                        if viewModel.invest_project == index.full_name {
                                            
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 4, content: {
                                    
                                    Text("Project")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text(viewModel.portfolios.isEmpty ? "You don't have any project" : viewModel.invest_project.isEmpty ? "Select Project" : viewModel.invest_project)
                                        .foregroundColor(viewModel.invest_project.isEmpty ? .gray : .black)
                                        .font(.system(size: 15, weight: .regular))
                                })
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.invest_amount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.invest_amount)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            DatePicker(selection: $viewModel.invest_date, displayedComponents: .date, label: {})
                                .labelsHidden()
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).stroke(.gray.opacity(0.3)))
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addInvest()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.fetchInvests()
                    viewModel.fetchPortfolios()
                    
                    viewModel.invest_date = Date()
                    viewModel.invest_amount = ""
                    viewModel.invest_project = ""
                    
                }, label: {
                    
                    Text("Invest")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.invest_amount.isEmpty || viewModel.invest_project.isEmpty ? 0.5 : 1)
                .disabled(viewModel.invest_amount.isEmpty || viewModel.invest_project.isEmpty ? true : false)
            }
        }
        .onAppear {
            
            viewModel.fetchPortfolios()
        }
    }
}

#Preview {
    HomeAddInvest(viewModel: HomeViewModel())
}
