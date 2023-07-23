//
//  HomeScreenView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    let effectId: String
    let animation: Namespace.ID
    
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    
    @Binding var isShowStartTrip: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Spacer()
                
                Text("Ready to go with MRT, Sarah?")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 4) {
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .frame(width: 35, height: 25)
                        .matchedGeometryEffect(id: effectId + "icon", in: animation)
                    
                    TextField("Where do you need directions to?", text: .constant(""))
                        .font(.system(size: 16))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                isShowStartTrip.toggle()
                            }
                        }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(12)
                .matchedGeometryEffect(id: effectId + "textfield", in: animation)
            }
            .frame(maxHeight: 200)
            .padding(.vertical, 24)
            .padding(.horizontal)
            .background(alignment: .top) {
                Rectangle()
                    .foregroundColor(Color("Primary"))
                    .edgesIgnoringSafeArea(.top)
                    .matchedGeometryEffect(id: effectId + "background",
                                           in: animation,
                                           anchor: .top,
                                           isSource: true)
            }
            
            Spacer()
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        HomeScreenView(effectId: "", animation: namespace, isShowStartTrip: .constant(false))
            .environmentObject(NavigationViewModel())
    }
}
