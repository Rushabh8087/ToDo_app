import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isEmailValid = true
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @Environment(\.managedObjectContext) private var viewContext
  
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                VStack {
                    Text("Register")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(isEmailValid ? Color.clear : Color.red)

                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Register") {
                        validateEmail()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

                }
            }.navigationBarHidden(true)
        }
    }

    func validateEmail() {
        if username.isEmpty,password.isEmpty {
            wrongPassword=2
            wrongUsername=2
        }
        //isEmailValid = email.contains("@") && email.contains(".") && email.lastIndex(of: ".")! > email.lastIndex(of: "@")!
        // Regular expression pattern for email validation
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: email)
        
        if isEmailValid {
            // Email is valid, perform registration or any other action
            print("Valid email: \(email)")
            // Here you can proceed with registration logic
        } else {
            // Email is invalid, show error message or handle accordingly
            print("Invalid email: \(email)")
        }
        
    }
    
   
   
    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
}


/*"regex" or "regexp," are patterns that define a search pattern, typically used for string matching or validation
 

 let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
 
 ^: Anchors the match to the start of the string.
 [a-zA-Z0-9._%+-]+: Matches one or more characters that can be lowercase letters (a-z), uppercase letters (A-Z), digits (0-9), or special characters (._%+-).
 @: Matches the '@' symbol, which is required in a valid email address.
 [a-zA-Z0-9.-]+: Matches one or more characters that can be lowercase letters (a-z), uppercase letters (A-Z), digits (0-9), or the '.' or '-' symbols.
 \.: Escapes the '.' symbol to match it literally. The backslash \ indicates that '.' should be treated as a regular character, not as a special regex character.
 [a-zA-Z]{2,}: Matches two or more characters that can be lowercase letters (a-z) or uppercase letters (A-Z). This is typically used to match the top-level domain (e.g., com, org).
 $: Anchors the match to the end of the string.
 
 NSPredicate: This class in iOS/macOS is used to define conditions used to filter collections of objects. It's often used with Core Data or to filter arrays and dictionaries. In this case, we're using it to evaluate whether the email string matches the pattern defined by emailRegex.
 format:"SELF MATCHES %@": This format string specifies that we want to evaluate whether the target string (SELF) matches a given pattern (%@). %@ is a placeholder for the pattern we provide.

*/
