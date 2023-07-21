//
//  PlanCard.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 21/07/23.
//

import SwiftUI

struct PlanCard: View {
    var recommendation: RoutesRecommendation
        
        var body: some View {
            HStack(alignment: .center) {
                if(recommendation.preferences == "No Preferences"){
                    Image(systemName: "figure.arms.open")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .padding(.all)
                } else if(recommendation.preferences == "Wheelchair"){
                    Image(systemName: "figure.roll")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .padding(.all)
                } else {
                    Image(systemName: "figure.outdoor.cycle")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .padding(.all)
                }
                
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(recommendation.departureStation)
                        .fontWeight(.semibold)
                    Text(recommendation.departureGate)
                        .font(.caption)
                        .fontWeight(.light)
                }
                .padding(.vertical)
                
                Spacer()
                
                Image(systemName: "chevron.forward")
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(recommendation.arrivalStation)
                        .fontWeight(.semibold)
                    Text(recommendation.arrivalGate)
                        .font(.caption)
                        .fontWeight(.light)
                }
                .padding(.trailing)
            }
            .frame(maxWidth: .infinity)
            .background(Color("CardBackground").opacity(0.3))
            .cornerRadius(10)
            .padding(.horizontal)
        }
}

//struct PlanCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanCard()
//    }
//}
