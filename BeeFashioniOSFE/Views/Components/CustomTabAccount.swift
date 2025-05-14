//
//  CustomTabAccount.swift
//  BeeFashioniOSFE
//
//  Created by Nguyễn Hưng on 14/05/2025.
//

import SwiftUI

struct CustomTabAccount: View {
    var icon: String
    var nametab: String
    
    var body: some View {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .frame(width: 24, height: 24)
                
                Text(nametab)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                
                Image(systemName: "chevron.forward")
                    .font(.system(size: 24))
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
    }
}

#Preview {
    CustomTabAccount(
        icon: "person.fill",
        nametab: "Tài khoản"
    )
}
