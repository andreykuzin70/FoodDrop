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
    @Binding var goToNavMenu: Bool
    
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
                
                LogInFormView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn, goToNavMenu: $goToNavMenu).environmentObject(LogInVM())
                
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(goToCreateAccount: .constant(false), goToLogIn: .constant(true), goToNavMenu:.constant(false)).environmentObject(LogInVM())
    }
}

struct LogInFormView: View {
    @State var email: String = "bob123@gmail.com"
    @State var password: String = "Bobby1"
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    @Binding var goToNavMenu: Bool
    
    @State var showAlert = false
    
    @EnvironmentObject var session: LogInVM
    
    
    // a method that listens to any change that happend the user signing
    func getUser () {
        session.listen()
    }
    
    //https://benmcmahen.com/authentication-with-swiftui-and-firebase/
    ///
    
    // This method takes care of user signing in. if there is an error it changes the state of the alert otherwise changes the state of the view to which it next go to. This is used in the action of the login button
    func logIn () {
        session.signIn(email: email, password: password) { (result, error) in
                if error != nil {
                    self.showAlert = true
                } else {
                    print("Log in success")
                    self.goToNavMenu = true
                    self.goToLogIn = false
                    self.goToCreateAccount = false
                }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .frame(width: 300)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .frame(width: 300)
            Button(
                action: {
                    self.logIn()
                },
                label: {
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
            ).alert(isPresented: $showAlert) {
                Alert(title: Text("Log in Error"), message: Text("Account not found or password/username not mactched "), dismissButton: .default(Text("OK")))
            }
            
            Divider().frame(width:200)
            Button(
                action: {
                    self.goToCreateAccount = true
                    self.goToLogIn = false
                },
                label: {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.red)
                        .cornerRadius(15.0)
                }
            )
        }.onAppear(perform: getUser)
    }
}
