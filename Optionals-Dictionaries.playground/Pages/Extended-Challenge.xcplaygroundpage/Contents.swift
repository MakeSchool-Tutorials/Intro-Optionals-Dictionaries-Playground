/*:
 ![Make School Banner](./swift_banner.png)
 # Dictionaries and Optionals Extended Challenge
 
 ## A more robust contact book
 
 In this exercise, we will extend our previous challenge code to be more robust.
 
 ### Extended challenge
 
 Now that we have some basic code, it's time to "refactor" it!
 
 1. Create a `ContactBook` class. It should have the same functionality as the previous challenge, including `addContact`, `findContact`, `updateContact`, `deleteContact`, and `allContacts` methods.
 1. Create a `ContactDetails` class. Replace your values with this class and update your methods accordingly. You'll want to update what they print out to make sense. We're going to leave this pretty open ended for you but here are some other values to consider: home phone, cell phone, email, Facebook profile, LinkedIn profile. How will you store these? Maybe you should use optionals... hint hint ;)
 1. Create a few `ContactBook` objects and add data to them. Test them out!
 
 - callout(Additional Challenge): Try implementing a favorite contacts feature in `ContactBook`. All these contacts should be accessable via the normal methods but you should also include a new `favoriteContacts` method that only prints out your favorites!
 
 */
class ContactBook {
    
    var phoneBook: [String: ContactDetails]
    
    init() {
        phoneBook = [:]
    }
    
    func favoriteContacts() {
        for name in phoneBook.keys {
            if phoneBook[name]!.isFavorite {
                print("\(name) is a favorite contact and has the following contact details")
                phoneBook[name]?.printDetails()
            }
        }
    }
    
    func addContact(name: String, contactDetail: ContactDetails) {
        phoneBook[name] = contactDetail
        print("\(name) has been added to your phone book")
    }
    
    func findContact(name: String) {
        if phoneBook[name] == nil {
            print("\(name) is not in your phone book!")
        } else {
            print("\(name) has the following contact details")
            phoneBook[name]?.printDetails()
        }
    }
    
    func updateContact(name: String, contactDetail: ContactDetails) {
        if phoneBook[name] == nil {
            print("\(name) did not exist. It has now been added to you phone book.")
        } else {
            print("\(name) has been updated in your phone book")
        }
        phoneBook[name] = contactDetail
    }
    
    func deleteContact(name: String) {
        if phoneBook[name] == nil {
            print("\(name) did not exist.")
        } else {
            phoneBook[name] = nil
            print("\(name) has been deleted from your phone book.")
        }
    }
    
    func allContacts() {
        //.sort() returns a sorted array of keys for the respective dictionary
        for key in phoneBook.keys.sort() {
            findContact(key)
        }
    }
}


class ContactDetails {
    var homePhone: String?
    var cellPhone: String?
    var email: String?
    var facebook: String?
    var linkedIn: String?
    var isFavorite: Bool
    
    init(homePhone: String?, cellPhone: String?, email: String?, facebook: String?, linkedIn: String?, isFavorite: Bool) {
        self.homePhone = homePhone
        self.cellPhone = cellPhone
        self.email = email
        self.facebook = facebook
        self.linkedIn = linkedIn
        self.isFavorite = isFavorite
    }
    
    func printDetails() {
        print("homePhone: \(homePhone!)\ncellphone: \(cellPhone!)\nemail: \(email!)\nfacebook: \(facebook!)\nlinkedIn: \(linkedIn!)")
    }
}

var makeSchoolContactBook: ContactBook = ContactBook()
var makeschool: ContactDetails = ContactDetails(homePhone: "4081234567", cellPhone: "6501234567", email: "hello@makeschool.com", facebook: "MakeSchool Community", linkedIn: "MakeSchool Inc.", isFavorite: true)
var stanford: ContactDetails = ContactDetails(homePhone: "8181234567", cellPhone: "6151234567", email: "visitorinfo@stanford.edu", facebook: "Stanford University", linkedIn: "Stanford", isFavorite: false)

makeSchoolContactBook.addContact("Make School", contactDetail: makeschool)
makeSchoolContactBook.addContact("stanford", contactDetail: stanford)
makeSchoolContactBook.findContact("Make School")
makeSchoolContactBook.deleteContact("stanford")
makeSchoolContactBook.favoriteContacts()
/*:
 [Previous](@prev)
 */
