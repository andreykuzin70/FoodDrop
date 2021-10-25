

**CMSC436 Project**

**Project Team 12**

● Andrey Kuzin

● Natnael Mekonnen

● Kibreab Gebrehiwot

● Shahryar Shagoshtasbi

**Food Drop**

**Overview:**

Growing up my best friend and I would sometimes sneak out in the evening and take a

trip down to the local Dunkin’ Donuts at the plaza at the end of the day night when all the

leftover donuts were being scrapped and thrown away. And sometimes if we were lucky and the

manager was nice we would be given a batch of free donuts, that would otherwise go to waste.

Americans are known to be the global leader in food waste. According to rts.com, more than 80

billion lbs of food is wasted in the U.S annually. A large portion of that is food wasted in the

Restaurant and Dining industry. As a result, we want to tackle this problem and connect the

restaurants and Eateries, such as Dunkin’ Donuts with both people and charitable organizations

which have the resources for distributing these foods to people in need, instead of throwing them

away. Since in many cases the food isn’t bad, restaurants just have a high food turnover rate,

since they tend to do meal prep every morning.

The high level concept of our app allows restaurants to make food postings of leftover

meals that weren’t sold throughout the day or good food they just want to get rid of at the end of

the day to clean out their kitchen. Which can then be claimed, by an organization or an

individual, for pick up at a discounted price or for free. This way we are both contributing to the

effort of decreasing the amount of food waste as well as helping local people and businesses.

Businesses can use their food donations as write offs for tax purposes at the end of the year

because there would be a direct record of all transactions, this way there would be an incentive

and a benefit for both parties.





**Goals**

The primary goal of our app was to create a channel of communication between Restaurants and

People to help prevent food waste and offer restaurants an alternative to throwing food away.

**User Accounts and Login**

● Our very first goal was to create a **SignIn View** and **Create Account view**, this would

allow people and restaurants to create and login into their unique, personal accounts.

This is significant because it would serve as the base and foundation for the rest of our

application, which would allow many users to interact with the app and make unique

posts and claims for food items.

**Food Posts**

● Our next goal was to give users the ability to make food postings by entering required

information regarding the business and food and upload them to a persistent database for

retrieval. In this case we used Firebase.

**Claiming Meal**

● Next once our food postings worked we worked on giving organizations/individuals the

ability to claim a meal from the universal food postings page. This required us to fetch

the data from our database

**Include Image with Food Post**

● We also wanted to elevate the Food Postings and allow restaurants to post images of the

foods, along with posts, this way the user can get a better understanding of what the food

is giving them a better judgment of whether they want it or not. Because there are

different kinds of recipes and different portions and they say “A picture is worth more

than a million words.”





**Multiple Tabs**

● Add multiple tabs, one for each task, so one for Posting and a separate one for Claiming

items, this would be better for overall user usability, separating functionality, making

navigating easier with comprehensible layout.

**Filter Food Posts**

● We changed this to be a stretch goal for us after beginning to work on the milestones. We

originally wanted to implement a feature that would have different filters for categorizing

food postings by Date, Food Type and Location. However, at the moment we have only

implemented a filter for Date, this way the user can more easily access Newer posts and

navigate to food posts of interest. During the development process we found the latter

filter options to require more complex metadata and that is something we will continue

pursuing in our future plans.

**Ratings**

● Finally we wanted to add a feature that would allow for users to leave a rating after food

was picked up, this way restaurants could build up a reputation on the platform as well as

receive feedback.

**Map Pick Up Location**

● This was a stretch goal to implement a map, so Claim Food View shows up displaying

the specific locations of each Food listing, this way the user could have a better

understanding of where the food is located in proximity to surrounding places. This

feature can be improved but we are very happy that we were able to incorporate it even at

this stage.

**Donations**

● This was also a stretch goal, we wanted to allow users to be able to make a

donation when claiming a meal, however, as suspected adding this feature was

much harder than adding a button and a few input fields. Despite not being able to





process Payments, because it was way outside the scope of this class, we created a

Donation Page so as a result we were able to partially implement our goal.

**Pick Up Food Window**

● This was a stretch goal where we wanted a feature that would create a window for

pickup/expiry of the food, after which post is either removed, or not valid to be claimed.

(Active/Inactive feature) This way we prevent people from claiming outdated posts as

well as clean up the users feed from excess. We were unable to accomplish this at the

moment, but will pursue in the future.

**Expansion**

● Two other stretch goals we had were expanding to grocery stores(ex: in-store

Bakery) for different types of groceries, as well as partnering up with Uber or Lift

to allow for delivery of one's food. However, these were goals for a larger time

frame.





**User Interaction:**

a. **Sign In** - When you first start the app, you will be greeted by the Sign In menu

that gives the user an option to sign in using their email and password fields or

press the create an account button that redirects them to a separate view.





b. **Create An Account** - If the viewer selects to create a new account, they will be

taken to this view where they will be prompted to fill out several fields that gather

metadata/information about the user, necessary for creating an account and

implementing certain functionality within the app. Once created, it returns back to

the sign in view and allows one to log in.





c. Once you log in, you are immediately taken to a view displaying all the currently

available food items in the **Available Foods View**. At the top left corner you will

see an icon which will allow you to open a **navigation sidebar**.





d. In the **Available Foods View** if you click on an item, it will bring up an item

specific **Claim Food View** which will have Food details. Including Name,

location, a map with the location pinpointed, the time and date it was made as

well as date and time by which it should be picked up and finally a claim food

button which would allow one to claim the food to remove it from the available

foods page and add it to their Claimed Food Tab so that they can still have access

to it.





e. The **Navigation page** reveals the user icon, welcoming the user by their name, as

well as a list of options with navigation links for redirection. The list consists of

“Make a Post”, “Claim a Meal”, “Food Claimed”, “Food Posted” and a “Log

out”.





f. **Make a Post View** - as suggested by the name allows the user to create a new

post or food listing, the view consists of several text and date fields and a submit

button. The user is prompted to enter the Food Type or Name, the PickUp

Address. As well as select the dates of when the food item was made and when it

should be picked up by. The view also allows the user to select whether the item

is: Fresh, About to Expire or Expired. Which is metadata that can later be used for

either visualization or sorting.





g. **Claim a Food View** - The Claim Food view displays the information specific to

the food item. It includes the Name of the food, Pick Up Address, Map displaying

the location, the date the item was Made On, the Pick up Date and a button that

allows the user to add it to the users claimed food.





h. **Foods You Claimed View** - This view gives the user a one stop shop when

looking for all the food posts that they have claimed, along with all the food item

details at hand, so that they could easily access details like locating the address

when ready to pick up the meal or give a rating based on the experience they had.





**i. Foods You Posted View -** This view shows the user all of the Food Posts that

they have personally made, with all the food details. This is so that each user can

keep track of all their posts and interactions.





**j. Posted Food Details -** When you select an item from the Food You Posted it will

display an item specific view displaying all the Food Details. This view is very

similar to the claim food view, except that it is missing the Claim Food button

because one cannot Claim their own food.





**k. Donation View -** Since our app is intended to be a charitable effort, we offer the

user an option to donate to organizations which are working on the same cause of

eliminating food waste. We have linked several of the largest charities, connecting

them to our users and spreading awareness.

**l. Demo** - To view the recorded demo of our app please click on the following link,

<https://youtu.be/GNqO8azf2RI>





**Development Process**

We developed this project outside of class and because we’re all students and have other

responsibilities, we weren’t able to collaborate as much as we may have wanted to throughout

the development process due to the pandemic. At the very start we designated and split up tasks

amongst group members, so that everyone felt responsible and that their work was important to

the success of the project. For example two people were responsible for Database Integration,

someone else was responsible for integrating a Navigation Menu, another group member was in

charge of creating new views, etc.

As a result most of the work was done independently, occasionally making things

difficult because Xcode already has it’s weird quirks and faults, but now we are attempting to

merge different peoples' work, and as we know different individuals follow different approaches

and coding patterns. Putting everything together involved the most collaboration effort.

Therefore, a lot of our time involved getting our independent parts to work together.

Nonetheless, towards the end we found an efficient branching technique. We would also

communicate to each other which files were being worked on and when, making things much

smoother and avoiding merging errors.

Despite working independently on tasks we still attempted to meet a least 2 times a week,

to review our progress and resolve any issues/bugs, if anyone was struggling. Now in retrospect I

believe this was a very good strategy because it required everyone to look into all the moving

parts, giving everyone a better understanding of how the overall app functioned.

Looking back the development process was full of both ups and downs, but despite that

we were able to stay fairly consistent with our original timeline. Nonetheless, there were a few

places that gave us hiccups, such as working with the database integration and retrieving/ storing

information. More specifically it was an issue when we were implementing the features allowing

users to upload images with the food posts. The images were stored separately from the database

in storage and had to be retrieved. As well as their size and the basic tier capabilities of the free

version of firebase made some aspects difficult. One other feature that resulted in us innovating

was the task of filtering Food Posts. Originally we wanted to filter by Location or Food Type,

however, during the development process we realized that at the moment that would not be as





feasible at the moment because extra metadata would be needed. Therefore, because we wanted

to keep that feature we decided to improvise and allow it to filter by Made on date. Nonetheless,

despite having these obstacles along the way we still want to polish and implement all the goals

we initially had now that we’ve worked and learned through our development process.

**Future Direction:**

Over the past couple of months, we explored and expanded our knowledge in developing

IOS apps via participating in this course and experiencing real world app development. After

working on this project as our first experience, we believe that turning this into a full fledged

functional, ready to hit the App Store app may be a fun summer project that we would want to

pursue. This would mean adding additional features like a navigation system, incorporating a

GPS, that would display and navigate the user through the fastest route to the pick up location.

This would require further integration of the map feature and while being a challenge it would

make the App a lot more useful. We may also want to potentially create different types of

accounts, for example : Business/Organization Accounts vs. Personal, which would include

different privileges and features. That way we could add a functionality where accounts receive

notifications when a food they posted was claimed, thereby making the app more interactive and

dynamic.

As well as pursue the original stretch goals we had set at the beginning during our

proposal which included: adding Donations and partnering with Grocery stores or delivery

services. We think this app idea has the potential of having a major impact as a charitable cause

which would support the communities around, while mimicking the business models of existing

Food Apps. There are many successful apps such as DoorDash and Instacart which have

similarities with our app, giving us reason to believe that FoodDrop may very well become a

flourishing product. Yet that would require us to not only create a working app but also an

outstanding business model!

