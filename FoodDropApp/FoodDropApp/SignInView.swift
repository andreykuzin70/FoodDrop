//
//  SignInView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/17/21.
//

import SwiftUI

struct SignInView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView()
                
                Spacer()
                
                Text("Log In")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.bottom, 20)
                
                LogInFormView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn)
                
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(goToCreateAccount: .constant(false), goToLogIn: .constant(true))
    }
}

struct LogInFormView: View {
    @State var username: String = ""
    @State var password: String = ""
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .frame(width: 300)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .frame(width: 300)
            Button(action: {}, label: {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            })
            Divider().frame(width:200)
            Button(action: {
                self.goToCreateAccount = true
                self.goToLogIn = false
            }, label: {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.red)
                    .cornerRadius(15.0)
            })
        }
    }
}
