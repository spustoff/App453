//
//  HomeEdit.swift
//  App453
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct HomeEdit: View {
    
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
                        
                        Text("Edit Balance")
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
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Balance")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.balance.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.balance)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 4, content: {
                            
                            Text("Change (This Month)")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.change.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.change)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        Menu {
                            
                            ForEach(["Up", "Down"], id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.direction = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index)
                                        
                                        Spacer()
                                        
                                        if viewModel.direction == index {
                                            
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
                                        
                                        Image(systemName: viewModel.direction == "Up" ? "chevron.up" : "chevron.down")
                                            .foregroundColor(.white)
                                            .font(.system(size: 9, weight: .regular))
                                            .padding(6)
                                            .background(Circle().fill(viewModel.direction == "Up" ? .green : .red))
                                        
                                        Text(viewModel.direction)
                                            .foregroundColor(viewModel.direction == "Up" ? .green : .red)
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
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    HomeEdit(viewModel: HomeViewModel())
}
