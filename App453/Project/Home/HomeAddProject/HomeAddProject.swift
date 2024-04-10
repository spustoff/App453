//
//  HomeAddProject.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct HomeAddProject: View {
    
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
                        
                        Text("Add Project")
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
                            
                            ForEach(["proj_1", "proj_2", "proj_3", "proj_4"], id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.project_logo = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index)
                                        
                                        Spacer()
                                    }
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 4, content: {
                                    
                                    Text("Logo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text(viewModel.project_logo.isEmpty ? "Not Selected" : viewModel.project_logo)
                                        .foregroundColor(viewModel.invest_project.isEmpty ? .gray : .black)
                                        .font(.system(size: 15, weight: .regular))
                                })
                                
                                Spacer()
                                
                                Image(viewModel.project_logo)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Full Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.project_fullname.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.project_fullname)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Short Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.project_shortname.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.project_shortname)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.project_text.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.project_text)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Current Price")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.project_currentprice.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.project_currentprice)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Price Change (This Month)")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.project_pricechange.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.project_pricechange)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        Menu {
                            
                            ForEach(["Up", "Down"], id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.project_direction = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index)
                                        
                                        Spacer()
                                        
                                        if viewModel.project_direction == index {
                                            
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 4, content: {
                                    
                                    Text("Direction")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    HStack(spacing: 4) {
                                        
                                        Image(systemName: viewModel.project_direction == "Up" ? "chevron.up" : "chevron.down")
                                            .foregroundColor(.white)
                                            .font(.system(size: 9, weight: .regular))
                                            .padding(6)
                                            .background(Circle().fill(viewModel.project_direction == "Up" ? .green : .red))
                                        
                                        Text(viewModel.project_direction)
                                            .foregroundColor(viewModel.project_direction == "Up" ? .green : .red)
                                            .font(.system(size: 15, weight: .regular))
                                    }
                                })
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).stroke(.gray.opacity(0.3)))
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addPortfolio()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.fetchInvests()
                    viewModel.fetchPortfolios()
                    
                    viewModel.project_logo = ""
                    viewModel.project_fullname = ""
                    viewModel.project_shortname = ""
                    viewModel.project_text = ""
                    viewModel.project_currentprice = ""
                    viewModel.project_pricechange = ""
                    viewModel.project_direction = ""
                    
                }, label: {
                    
                    Text("Invest")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.project_logo.isEmpty || viewModel.project_fullname.isEmpty || viewModel.project_shortname.isEmpty || viewModel.project_text.isEmpty || viewModel.project_currentprice.isEmpty || viewModel.project_pricechange.isEmpty || viewModel.project_direction.isEmpty ? 0.5 : 1)
                .disabled(viewModel.project_logo.isEmpty || viewModel.project_fullname.isEmpty || viewModel.project_shortname.isEmpty || viewModel.project_text.isEmpty || viewModel.project_currentprice.isEmpty || viewModel.project_pricechange.isEmpty || viewModel.project_direction.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    HomeAddProject(viewModel: HomeViewModel())
}
