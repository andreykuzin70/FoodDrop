//
//  PostFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/17/21.
//

import SwiftUI
import CoreLocation

struct PostFoodView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
//                HeaderView()
                
                Spacer()
                
                Text("Post Food")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                
                PostFoodFormView()
                
                Spacer()
            }
        }
    }
}


struct PostFoodView_Previews: PreviewProvider {
    static var previews: some View {
        PostFoodView()
    }
}

struct PostFoodFormView: View {
    
    @State var foodType: String = ""
    @State var pickUpAdd: String = ""
    @State var pickUpDate: Date = Date()
    @State var madeOnDate: Date = Date()
    @State var pickedFoodCondition = "Fresh"
    // For camera use
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State var imageToUpload:UIImage?
    @State var imageButtonText = "Add Image"
    
    var foodCondition = ["Fresh","About to Expire","Expired"]
    @State var location: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 0, longitude: 0)
    
    @State var showAlert = false
    
    var body: some View {
        VStack {
            
            TextField("Food Type", text: $foodType)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            TextField("Pick Up Address", text: $pickUpAdd)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            DatePicker("Made on ", selection: $madeOnDate)
                .frame(height: 20)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            
            DatePicker("Pickup By", selection: $pickUpDate)
                .frame(height: 20)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            Button(action: {
                self.showActionSheet = true
            }){
                Text(imageButtonText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .padding(.top)
            }.actionSheet(isPresented: $showActionSheet){
                ActionSheet(title: Text("Add Image to Post "),
                            message: nil ,
                            buttons: [
                                .default(Text("Camera"), action:{
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                }),
                                
                                .default(Text("Photo Library"), action:{
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                }),
                                
                                .cancel()
                            ])
            }.sheet(isPresented: $showImagePicker){
                ImagePicker(image: self.$imageToUpload,
                            showImagePicker: self.$showImagePicker, imageButtonText: $imageButtonText,
                            sourceType: self.sourceType)
            }
            
            
            Picker("Food Condition", selection: $pickedFoodCondition) {
                ForEach(foodCondition, id:\.self){
                    Text($0)
                }
            }.frame(height: 40)
            .padding()
            .padding(.top, 40)
            .cornerRadius(5.0)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                CLGeocoder().geocodeAddressString(pickUpAdd) {a, b in
                    if let placemarks = a {
                        print("got placemarks")
                        if let loc = placemarks[0].location{
                            location = loc.coordinate
                        }
                    }
                    print("\(location.latitude) \(location.longitude)")
                    
                    let postFoodVM = PostFoodVM()
                    
                        if postFoodVM.post_food(food_type: foodType, pickup_address: pickUpAdd, madeOnDate: madeOnDate, pickup_date: pickUpDate, location: location, imageToUpload: imageToUpload){
                            
                            // successfully added
                            print("food successfully posted")
                            // Add a successfully posted view here
                            // go back to default input
                            foodType = ""
                            pickUpAdd = ""
                            pickUpDate = Date()
                            madeOnDate = Date()
                            imageButtonText = "Add Image"
                        } else {
                            showAlert = true
                        }
                }
            }, label: {
                Text("Submit Food")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    .padding(.top)
            }).alert(isPresented: $showAlert) {
                Alert(title: Text("Submission Failed"), message: Text(" Must fill the text fields "), dismissButton: .default(Text("OK")))
            }
            
            
            Spacer()
            
        }
        
    }
    
}



