//
//  PokemonInfoPanel.swift
//  SwiftUIProject
//
//  Created by wjc on 2022/10/13.
//

import SwiftUI

struct PokemonInfoPanel: View {
    
    @State var darkBlur = false
    
    let model: PokemonViewModel
    var abilities: [AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    
    var pokemonDescription: some View {
        Text(model.descriptionText)
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                self.darkBlur.toggle()
            }){
                Text("切换模糊效果")
            }
            topIndicator
            Header(model: model)
            pokemonDescription
            Divider()
            AbilityList(
                model: model,
                abilityModels: abilities)
        }
        .padding(
            EdgeInsets(
                top: 12,
                leading: 30,
                bottom: 30,
                trailing: 30
            )
        )
        .blurBackground(style: darkBlur ? .systemMaterialDark : .systemMaterial)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: .sample(id: 1))
    }
}
