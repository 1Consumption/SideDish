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
        ScrollView {
            switch viewModel.state {
            case .done:
                SideDishGridView(sideDish: viewModel.sideDish)
                .padding(.horizontal, 10)
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
                EmptyView()
            }
        }
        .onAppear(perform: {
            viewModel.retrieveDish()
        })
    }
}

struct SideDishView_Previews: PreviewProvider{
    static var previews: some View {
        SideDishView()
            .considerStatusBar()
    }
}
