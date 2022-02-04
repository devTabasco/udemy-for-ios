
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler{
    
    //delegate 변수를 이용해 protocol 호출
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    
    //protocol의 함수 이용
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic : AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler){
        //EmergencyCallHandler로 부터 신호를 받아 performCPR을 동작시켜줌.
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStetescope(){
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill(){
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler:emilio)

emilio.assessSituation()
emilio.medicalEmergency() //override 된 함수가 불러와짐
