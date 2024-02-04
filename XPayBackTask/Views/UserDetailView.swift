//
//  UserDetailView.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 03/02/24.
//

import SwiftUI

struct UserDetailView: View {
    
    @StateObject var userVM : UserDetailVM
    
    var body: some View {
            VStack(){
                UserRemoteImage(urlString: userVM.user.image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 120)
                    .cornerRadius(8)
                    .padding(.vertical,20)
                List{
                    Section("About"){
                        DetailsRow(title: "Maiden Name", value: userVM.user.maidenName)
                        DetailsRow(title: "Age", value: "\(userVM.user.age)")
                        DetailsRow(title: "Gender", value: userVM.user.gender)
                        DetailsRow(title: "Email", value: userVM.user.email)
                        DetailsRow(title: "Phone", value: userVM.user.phone)
                        DetailsRow(title: "Username", value: userVM.user.username)
                        DetailsRow(title: "Birth Date", value: userVM.user.birthDate)
                        DetailsRow(title: "Blood group", value: userVM.user.bloodGroup)
                        DetailsRow(title: "Height", value: "\(userVM.user.height) Cm")
                        DetailsRow(title: "Weight", value: "\(userVM.user.weight) Kg")

                    }
                    Section("Hair"){
                        DetailsRow(title: "Color", value: userVM.user.hair.color)
                        DetailsRow(title: "Type", value: userVM.user.hair.type)
                    }
                    Section("Address"){
                        DetailsRow(title: "Address", value: userVM.user.address.address ?? "")
                        DetailsRow(title: "City", value: userVM.user.address.city ?? "")
                        DetailsRow(title: "Postal Code", value: userVM.user.address.postalCode)
                        DetailsRow(title: "State", value: userVM.user.address.state)
                        DetailsRow(title: "Coordinates", value: "\(userVM.user.address.coordinates.lat), \(userVM.user.address.coordinates.lng)")
                    }
                    Section("Company"){
                        DetailsRow(title: "Name", value: userVM.user.company.name)
                        DetailsRow(title: "Title", value: userVM.user.company.title)
                        DetailsRow(title: "Department", value: userVM.user.company.department)
                        DetailsRow(title: "Address", value: userVM.user.company.address.address ?? "")
                        DetailsRow(title: "City", value: userVM.user.company.address.city ?? "")
                        DetailsRow(title: "Postal Code", value: userVM.user.company.address.postalCode)
                        DetailsRow(title: "State", value: userVM.user.company.address.state)
                        DetailsRow(title: "Coordinates", value: "\(userVM.user.company.address.coordinates.lat), \(userVM.user.company.address.coordinates.lng)")
                    }
                    Section("Crypto"){
                        DetailsRow(title: "Coin", value: userVM.user.crypto.coin)
                        DetailsRow(title: "Network", value: userVM.user.crypto.network)
                    }
                }
                
                if userVM.isLoading {
                    ZStack(alignment: .center){
                        ActivityIndicator()
                            .foregroundColor(.orange)
                        .frame(width: 100, height: 100)}
                }
            }
            .navigationTitle(userVM.user.firstName + " " + userVM.user.lastName)
            .navigationBarTitleDisplayMode(.inline)
            
        
    }
    
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userVM: UserDetailVM(user: MockData.sampleUser))
    }
}
