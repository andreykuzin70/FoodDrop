//
//  SignInView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/17/21.
//

import SwiftUI

struct LogOutView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    @Binding var goToNavMenu: Bool
    
//    @EnvironmentObject var session: LogInVM
    
    func logOut() {
        goToNavMenu = false
        goToLogIn = true
        let ret = LogInVM().signOut()
        print("Signed Out: \(ret)")
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView()
                
                Spacer()
                
                Text("Log Out")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.bottom, 20)
                
                Spacer()
            }
        }.onAppear(perform: logOut)
    }
}

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView(goToCreateAccount: .constant(false), goToLogIn: .constant(true), goToNavMenu: .constant(false)).environmentObject(LogInVM())
    }
}
