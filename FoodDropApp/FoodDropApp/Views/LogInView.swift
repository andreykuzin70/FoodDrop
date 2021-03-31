//
//  SignInView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/17/21.
//

import SwiftUI

struct LogInView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    @Binding var goToPost: Bool
    
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
                
                LogInFormView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn, goToPost: $goToPost)
                
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(goToCreateAccount: .constant(false), goToLogIn: .constant(true), goToPost: .constant(false))
    }
}

struct LogInFormView: View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    @Binding var goToPost: Bool
    
    @State var showAlert = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .frame(width: 300)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .frame(width: 300)
            Button(action: {
                let logInVM = LogInVM()
                if logInVM.validate_logIN(email: email, password: password) == false {
                    showAlert = true
                } else {
                    // take me to post/ food for now
                    print("Log in success")
                    self.goToPost = true
                    self.goToLogIn = false
                    self.goToCreateAccount = false
                }
                
            }, label: {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }).alert(isPresented: $showAlert) {
                Alert(title: Text("Log in Error"), message: Text("Account not found or password/username not mactched "), dismissButton: .default(Text("OK")))
            }
            
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
