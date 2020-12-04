//
//  SideDishView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

struct SideDishView: View {
    @ObservedObject var viewModel: SideDishViewModel = SideDishViewModel()
    
    var body: some View {
        NavigationView {
            SideDishGridView(sideDish: viewModel.sideDish)
                .navigationBarHidden(true)
        }
    }
}

struct SideDishView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishView()
            .considerStatusBar()
    }
}
