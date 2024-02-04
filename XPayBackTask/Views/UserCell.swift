//
//  UserListView.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 01/02/24.
//

import SwiftUI

struct UserCell: View {

    let user: User
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text("\(user.id).")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.leading)
            UserRemoteImage(urlString: user.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80)
                .padding(.vertical,10)

            VStack(alignment: .leading, spacing: 5) {
                Text(user.firstName + " " + user.lastName)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)

                Text("Age: \(user.age)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
    
}


struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: MockData.sampleUser)
    }
}
