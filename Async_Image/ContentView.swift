//
//  ContentView.swift
//  Async_Image
//  Created by Admin on 15/11/2022.

import SwiftUI

extension Image {
    
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {

    private let imageURL: String = "https://preview.free3d.com/img/2020/01/2279682655429592924/zgtz2gay.jpg"
    
    var body: some View {
       
        ZStack{
            AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 1.7, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                switch phase {
                case .success(let image):
                    image.imageModifier()
                         .transition(.move(edge: .bottom))
                         .frame(width: 800, height: 800)
                case .failure:
                    Image(systemName: "ant.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill").iconModifier()
                @unknown default:
                    ProgressView()
                }
                   }
              .padding(40)
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
