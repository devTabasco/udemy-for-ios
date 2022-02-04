//
//
////operation이라는 변수를 줘서 데이터 형태만 맞으면 다른 함수들을 넣을 수 있음.
//func calculator(n1: Int, n2: Int, operation: (Int, Int)-> Int) -> Int{
//    return operation(n1, n2)
//}
//
//func add(no1:Int, no2: Int) -> Int{
//    return no1+no2
//}
//
//
////Closure
////{ (no1:Int, no2:Int) -> Int in
////    return no1*no2
////}
//
//let result = calculator(n1: 2, n2: 3) {$0 * $1}
//
//print(result)


let array = [6,2,3,9,4,1]

//func addOne(n1:Int) {n1 + 1}

//closure에서 축약해서 쓰려면 무조건 $을 써야함.
let newArray = array.map({"\($0)"})

print(newArray)
