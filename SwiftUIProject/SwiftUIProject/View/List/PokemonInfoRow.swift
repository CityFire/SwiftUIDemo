//
//  PokemonInfoRow.swift
//  SwiftUIProject
//
//  Created by wjc on 2022/10/13.
//

import SwiftUI

struct PokemonInfoRow: View {
    let model: PokemonViewModel
    let expanded: Bool
    
    var body: some View {
        VStack {
            // Image and name
            HStack {
                Image("Pokemon-\(model.id)")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 4)
                Spacer()
                VStack {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 12)
            Spacer()
            // Button
            HStack(spacing: expanded ? 20 : -30) {
                Spacer()
                Button(action: { print("fav") }) {
                    Image(systemName: "star")
                        .modifier(ToolButtonModifier())
                }
                Button(action: { print("Panel") }) {
                    Image(systemName: "chart.bar")
                        .modifier(ToolButtonModifier())
                }
                Button(action: { print("Web") }) {
                    Image(systemName: "info.circle")
                        .modifier(ToolButtonModifier())
                }
            }
            .padding(.bottom, 12)
            .opacity(expanded ? 1.0 : 0.0)
            .frame(maxHeight: expanded ? .infinity : 0)
        }
        .frame(height: expanded ? 120 : 80)
        .padding(.leading, 23)
        .padding(.trailing, 15)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(model.color, style: StrokeStyle(lineWidth: 4))
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, model.color]), startPoint: .leading, endPoint: .trailing
                        )
                    )
            }
        )
        .padding(.horizontal)
        .animation(.spring(
            response: 0.55,
            dampingFraction: 0.425,
            blendDuration: 0
        ))
    }
}

struct ToolButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
    }
}

struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoRow(model: PokemonViewModel.sample(id: 1), expanded: true)
    }
}
