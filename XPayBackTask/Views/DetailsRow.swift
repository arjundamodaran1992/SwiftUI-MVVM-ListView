//
//  DetailsRow.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 03/02/24.
//

import SwiftUI

struct DetailsRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text(title)
                .font(.title3)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            Spacer()
            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

struct DetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailsRow(title: "Weight", value: "25")
    }
}
