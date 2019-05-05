// willSet and didSet both have a default parameters newValue and oldValue.
// Not called at initizalsation at the first point
// An inital value is always required for an propety observer hence lazy vars cannot use them
// Can be used on computed and stored properties that contain a value unlike set and get which are only for computed properties

struct Robot {

    var year:Int = 1996
    var type: String = "Autobot"
    var isTurnedOn: Bool = false
    var name: String? {
        willSet { //this is called before the value is stored in the name variable
            isTurnedOn = true
        }
        didSet { //didSet is called after a value has been stored/updated opposite to willSet
            self.type = "Decepticon"
        }
    }
}

var myRobot = Robot()
myRobot.isTurnedOn
myRobot.type
myRobot.name = "Terminator"
myRobot.isTurnedOn
myRobot.type

//MARK Another example

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
