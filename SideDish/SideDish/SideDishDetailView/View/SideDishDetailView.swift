//
//  SideDishDetailView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/05.
//

import Combine
import SwiftUI

struct SideDishDetailView: View {
    @ObservedObject var viewModel: SideDishDetailViewModel = SideDishDetailViewModel(dataPublisher: NetworkManager())
    private let key: String
    private let title: String
    
    init(key: String, title: String) {
        self.key = key
        self.title = title
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(viewModel.sideDishDetail?.hash ?? "")")
                Text("\(title)")
            }
        }
        .onAppear {
            viewModel.retrieveSideDishDetail(with: key)
        }
    }
}

struct SideDishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishDetailView(key: "", title: "")
    }
}
