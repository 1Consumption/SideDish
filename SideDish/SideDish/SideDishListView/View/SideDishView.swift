//
//  SideDishView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

struct SideDishView: View {
    @StateObject var viewModel: SideDishViewModel = SideDishViewModel()
    
    var body: some View {
        NavigationView {
            SideDishGridView(sideDish: viewModel.sideDish)
                .considerStatusBar()
                .navigationBarHidden(true)
        }.alert(isPresented: $viewModel.isErrorOccured, content: {
            Alert(title: Text(viewModel.errorMessage),
                  message: nil,
                  primaryButton: .cancel(),
                  secondaryButton: .default(Text("다시 시도"),
                                            action: {
                                                viewModel.retrieveDish()
                                            }))
        })
    }
}

struct SideDishView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishView()
            .considerStatusBar()
    }
}
