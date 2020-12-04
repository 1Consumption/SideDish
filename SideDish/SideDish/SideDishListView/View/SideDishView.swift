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
            switch viewModel.state {
            case .done:
                SideDishGridView(sideDish: viewModel.sideDish)
                    .navigationBarHidden(true)
            case .failure(_):
                Button(action: {
                    viewModel.retrieveDish()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .padding()
                        .background(Color.labelColor)
                        .foregroundColor(.backgroundColor)
                        .clipShape(Circle())
                })
            default:
                AnyView(Color.clear)
            }
        }
        .onAppear(perform: {
            viewModel.retrieveDish()
        })
    }
}

struct SideDishView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishView()
            .considerStatusBar()
    }
}
