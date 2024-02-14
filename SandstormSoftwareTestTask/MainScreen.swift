//
//  ContentView.swift
//  SandstormSoftwareTestTask
//
//  Created by Roman Shestopal on 12.02.2024.
//

import SwiftUI
import SwiftData

struct MainScreen: View {
    @ObservedObject var model: ViewModel
    
    func createPandaImage(width: CGFloat, height: CGFloat, withXmark: Bool = false) -> some View {
        return VStack {
            if withXmark {
                Image(.panda)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height , alignment: .leading)
                    .scaleEffect(1.3)
                    .ignoresSafeArea()
                
                Button(action: {
                    withAnimation{
                        model.changeImageState()
                    }
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .frame(width: 32, height: 32)
                        .font(.title2)
                        .foregroundStyle(.white)
                        
                })
                .position(x: (width - 20), y: -(height - 30))
                .foregroundStyle(.gray)
            } else {
                Image(.panda)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height , alignment: .leading)
                    .clipped()
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                VStack(alignment: .center) {
                    createPandaImage(width: 150, height: geometry.size.height * 0.3)
                    
                    HStack(alignment: .center) {
                        Button(action: {
                            model.changeButtonState()
                        }, label: {
                            Text(model.isLockButton ? "Lock" : "Unlock")
                                .padding()
                                .foregroundStyle(.white)
                                .frame(width: geometry.size.width * 0.4, height: 56)
                                .background(Color.blue)
                                .clipShape(.rect(cornerRadius: 18))
                                .overlay(RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.indigo, lineWidth: 3))
                        })
                        .padding(10)
                        
                        Button (action: {
                            withAnimation {
                                model.changeImageState()
                            }
                        }, label: {
                            Text("Open from top")
                                .padding()
                                .foregroundStyle(.white)
                                .frame(width: geometry.size.width * 0.4, height: 56)
                                .background(Color.blue)
                                .clipShape(.rect(cornerRadius: 18))
                                .overlay(RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.indigo, lineWidth: 3))
                                .opacity(model.isLockButton ? 0.5 : 1.0)
                        })
                        .disabled(model.isLockButton)
                        .padding(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            model.changeImageState()
                        }
                    }, label: {
                        Text("Open full")
                            .padding()
                            .foregroundStyle(.white)
                            .frame(width: geometry.size.width * 0.85, height: 56)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 18))
                            .overlay(RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.indigo, lineWidth: 3))
                    })
                }
            }
            .frame(width: geometry.size.width)
            
            if model.isVisibleImage {
                createPandaImage(width: geometry.size.width, height: geometry.size.height, withXmark: true)
                    .transition(.move(edge: .top))
            }
        }
        .background(.gray)
    }
}

#Preview {
    MainScreen(model: ViewModel())
}
