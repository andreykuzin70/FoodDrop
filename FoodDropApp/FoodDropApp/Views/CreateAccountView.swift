//
//  CreateAccountView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/17/21.
//

import SwiftUI
import FirebaseAuth

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
                
                CreateAccountFormView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn).environmentObject(CreateAccountVM())
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
    @State var alertMessage = ""
    
    @EnvironmentObject var accountSession: CreateAccountVM

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
                self.createAccount()
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
                Alert(title: Text("Create account error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
            }
            
            Button(action: {
                self.goToCreateAccount = false
                self.goToLogIn = true
            }, label: {
                Text("🔙")
                    .font(.headline)
                    .padding()
                    .frame(width: 300)
                    .background(Color.blue)
                    .cornerRadius(15.0)
                    .padding(.top)
            })
        }
    }
    
    
    // This function takes care of the creation of new account. it validates if the textfields are empty and alert the user. if the user coudnt be added to the authentication for some reason, we show alert to correctly outputing
    func createAccount () {
    
        // check the validation of empty entries
        if !accountSession.validate_info(first_name: firstName, last_name: lastName, org_name: orgName, email: email, phone_num: phoneNumber, address: streetAddress, state: state, city: city, zipcode: zipcode, password: password){
            
            self.showAlert = true
            self.alertMessage = "One or more field is empty"
            return
        }
        
        // add to the auth database
        accountSession.createAccount(email: email, password: password) { (result, error) in
                //self.loading = false
                if error != nil {
                    self.showAlert = true
                    self.alertMessage = ("\(String(describing: error))")
                   
                    return
                } else {
                    print("Create Success")
                    self.goToCreateAccount = false
                    self.goToLogIn = true
                    
                    // add to the user database
                    accountSession.createAccountAddUser(firstName: firstName, lastName: lastName, orgName: orgName, email: email, phoneNum: phoneNumber, address: streetAddress, state: state, city: city, zipcode: zipcode, password: password)
                }
        }
        
    }
    
}
