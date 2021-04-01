//
//  LogIn.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation
import FirebaseAuth
import Combine

public class LogInVM: ObservableObject{
    @Published var userRepository = UserRepository()
    
    var didChange = PassthroughSubject<LogInVM, Never>()
    var session: Bool? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?

    // checks if the user is signed in or not. if the user is signed in we change the session ture to show that the user is in. ohter wise we make it false to indicate the user is not signed in.
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self.session = true
            } else {
                // if we don't have a user, set our session to nil
                self.session = false
            }
        }
    }
    
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    // for the signout use. it changes the session
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = false
            return true
        } catch {
            return false
        }
    }

    // not sure about this one yet
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    // additional methods (sign up, sign in) will go here
}
