
import Foundation

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {  //use to store task of todo --> user defined data type
    var id = String()
    var toDoItem = String()
    
    //Add more complicated stuff later if you want.
    
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()   //array of task
}


