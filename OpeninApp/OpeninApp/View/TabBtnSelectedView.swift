//
//  TabBtnSelectedView.swift
//  OpeninApp
//
//  Created by Avi Kheni on 05/05/24.
//

import SwiftUI

struct TabBtnSelectedView: View {
    var titleName: String
    var isSelected : Bool
    var btnAction : () -> Void
    var body: some View {
        Button {
            btnAction()
        } label: {
            Text(titleName)
                .fontWeight(.semibold)
                .foregroundStyle(isSelected ? .white : .gray)
                .padding(.horizontal ,25)
                .padding(.vertical,10)
                .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(isSelected ? .blue :.clear))
        }

    }
}

#Preview {
    TabBtnSelectedView(titleName: "Top Links", isSelected: false, btnAction: {})
}
