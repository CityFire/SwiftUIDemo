//
//  PokemonInfoPanelAbilityList.swift
//  SwiftUIProject
//
//  Created by wjc on 2022/10/13.
//

import SwiftUI

extension PokemonInfoPanel {
    struct AbilityList: View {

        let model: PokemonViewModel
        let abilityModels: [AbilityViewModel]?

        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("技能")
                    .font(.headline)
                    .fontWeight(.bold)
                if abilityModels != nil {
                    ForEach(abilityModels!) { ability in
                        Text(ability.name)
                            .font(.subheadline)
                            .foregroundColor(self.model.color)
                        Text(ability.descriptionText)
                            .font(.footnote)
                            .foregroundColor(Color(hex: 0xAAAAAA))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

//struct PokemonInfoPanelAbilityList: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

struct PokemonInfoPanelAbilityList_Previews: PreviewProvider {
    static var previews: some View {
//        PokemonInfoPanelAbilityList()
        PokemonInfoPanel.AbilityList(
            model: .sample(id: 1),
            abilityModels: AbilityViewModel.sample(pokemonID: 1))
    }
}
