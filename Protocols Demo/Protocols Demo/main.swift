
//protocol은 꼭 사용해야할 함수/변수를 미리 기재해두는 것.
//상속 받을 수 있고, 다만 상속받을 시 함께 상속받는 상위 class와 protocol이 같은 함수가 있다면,
//class의 규칙이 적용되기 때문에 꼭 함수를 사용할 필요가 없고, 오히려 override해서 사용해야한다.

protocol CanFly{
    func fly()
}

class Bird{
    
    var isFemale = true
    
    func layEgg(){
        if isFemale{
            print("The bird makes a new bird a shell.")
        }
    }
}

class Eagle : Bird, CanFly{
    func fly() {
        print("The eagle flaps its wings and lifts off into the sky.")
    }
    
    func soar(){
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird{
    func swin(){
        print("The penguin paddles through the water.")
    }
}

struct FlyingMuseum{
    func flyingDemo(flyingObject: CanFly){
        flyingObject.fly()
    }
}

struct Airplaine: CanFly{
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
    
    
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = Airplaine()
myEagle.fly()
myPlane.fly()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
