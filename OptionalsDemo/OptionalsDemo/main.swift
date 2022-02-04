/*optional 처리 방법
1. !를 붙이는 것은 강제로 처리하는 것. 좋은 방법은 아님. -> 변수가 nil 이었을 경우 runtime error가 날 수 있음
2. if문을 이용하여, nil이 아닐때만 !표를 붙여주는 방법
3. 다른 변수를 만들어 copy하면 에러가 나지 않음
4. optional ?? "default value" <- 이렇게 넣으면 nil 일때 default가 출력됨
5.


*/
let myOptional: String?

myOptional = "Changyong"

let text: String = myOptional!



