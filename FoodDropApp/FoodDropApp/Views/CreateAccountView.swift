//
//  CreateAccountView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/17/21.
//

import SwiftUI

struct CreateAccountView: View {
    
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView()
                
                Spacer()
                
                Text("Create Account")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.bottom, 20)
                
                CreateAccountFormView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn)
                Spacer()
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(goToCreateAccount: .constant(true), goToLogIn: .constant(false))
    }
}

struct CreateAccountFormView: View {
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var orgName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var phoneNumber: String = ""
    @State var streetAddress: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipcode: String = ""
    
    @State var showAlert = false
    //@State var successAlert = false
    
    var body: some View {
        VStack {
            HStack(spacing: -15) {
                TextField("First Name", text: $firstName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                    .disableAutocorrection(true)
                TextField("Last Name", text: $lastName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                    .disableAutocorrection(true)
            }
            TextField("Organization Name", text: $orgName)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .disableAutocorrection(true)
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
            TextField("Phone Number", text: $phoneNumber)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .keyboardType(.phonePad)
            TextField("Street Address", text: $streetAddress)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            HStack(spacing: -20) {
                TextField("City", text: $city)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                    .disableAutocorrection(true)
                TextField("State", text: $state)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                    .disableAutocorrection(true)
                TextField("ZipCode", text: $zipcode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
            }
            
            Button(action: {
                let createAccountVM = CreateAccount()
                if createAccountVM.create_Account(firstName: firstName, lastName: lastName, orgName: orgName, email: email, phoneNum: phoneNumber, address: streetAddress, state: state, city: city, zipcode: zipcode, password: password) {
                
                    self.goToCreateAccount = false
                    self.goToLogIn = true
                }else{
                    showAlert = true
                }
                
            }, label: {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    .padding(.top)
            }).alert(isPresented: $showAlert) {
                Alert(title: Text("Create account error"), message: Text(" One or more filds are empty "), dismissButton: .default(Text("OK")))
            }
        }
    }
}
