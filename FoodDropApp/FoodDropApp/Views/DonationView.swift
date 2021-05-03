import SwiftUI

struct DonationView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 50)),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        
        appearance.backgroundColor = UIColor.init(Color.green)
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = .blue
        
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Text("Donation")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                    .padding(.top, 10)
                Spacer()
                Text("Please support our cause by making some donations to your favorite charity and help us make a better world.")
                    .fontWeight(.medium)
                    .padding(.bottom, 30)
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
            
                Spacer()
                List{
                    Link("Action Against Hunger", destination: URL(string: "https://www.actionagainsthunger.org/")!)
                        .foregroundColor(.green)
                    Link("Feeding America", destination: URL(string: "https://www.feedingamerica.org/")!)
                        .foregroundColor(.green)
                    Link("Bread for the World", destination: URL(string: "https://www.bread.org/about-bread-world-institute")!)
                        .foregroundColor(.green)
                    Link("Food Bank for NY", destination: URL(string: "https://www.foodbanknyc.org/")!)
                        .foregroundColor(.green)
                    Link("The Global FoodBanking Network", destination: URL(string: "https://www.foodbanking.org/")!)
                        .foregroundColor(.green)
                    Link("Meals on Wheels America", destination: URL(string: "https://www.mealsonwheelsamerica.org/")!)
                        .foregroundColor(.green)
                    Link("Heifer International", destination: URL(string: "https://www.heifer.org/")!)
                        .foregroundColor(.green)
                    Link("The Hunger Project", destination: URL(string: "https://thp.org/")!)
                        .foregroundColor(.green)
      
                }
                Spacer()
                Text("Thanks!")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                Spacer()
               

                
            }
        }
        
    }
}

struct Donation_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}
