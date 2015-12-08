import UIKit

protocol Observable<T> {}

// Based on Observables
protocol Step {
  typealias T
  var completion: Observable<T>
}

struct Flow {
  let navigationController: UINavigationController
  static func flattenNestedTuples<A, B, C>
    (t: ((A, B), C)) -> (A, B, C) {
      return (t.0.0, t.0.1, t.1)
  }
  static func flattenNestedTuples<A, B, C, D>
    (t: (((A, B), C), D) -> (A, B, C, D) {
    return (t.0.0.0, t.0.0.1, t.0.1, t.1)
  }
  // With Step requirement
  func push<U, T where T: UIViewController,
    T: Step, U == Step.T>(vc: T)
    -> Observable<U> {
      navigationController.push(vc)
      return vc.completion
  }
  func pushWithState<S, U, T where T: UIViewController,
    T: Step, U == Step.T>(vc: T)(state: S)
    -> Observable<(S, U)> {
      navigationController.push(vc)
      return vc.completion.map { (state, $0) }
  }
  // Without Step requirement
  func push<T>(vc: UIViewController, completion: Observable<T>)
    -> Observable<T> {
      navigationController.push(vc)
      return completion
  }
  func pushWithState<S, T>(vc: UIViewController,
    completion: Observable<T>)(state: S)
    -> Observable<(S, T)> {
      navigationController.push(vc)
      return completion.map { (state, $0) }
  }
}



let flow = Flow(navigationController: vc)
let personOrHouse = flow.push(personOrHouseFlowVC)
  .flatMap { isPerson in
    if isPerson {
      return personFlow().map(PersonOrHouse.init)
    }
    else {
      return houseFlow().map(PersonOrHouse.init)
    }
  }
  .promise()


func personFlow() -> Observable<PersonSummary> {
  return Observable.just(value: ())
    .flatMap(flow.pushWithState(nameVC))
    .flatMap(flow.pushWithState(genderVC))
    .flatMap(flow.pushWithState(photoVC))
    .map(Flow.flattenNestedTuples)
    .map { (name, gender, photo) in
      Person(name: name, gender: gender, photo: photo)
    }
    .flatMap { person in
      summaryVC.viewModel = person
      return flow.push(summaryVC)
  }
}


// Without Step
func houseFlow() -> Observable<House> {
  return flow.push(houseNumberVC, houseNumberVC.doneButton)
    .flatMap(flow.pushWithState(houseStreetVC, houseStreetVC.doneButton))
    .map { (number, street) in House(number, street) }
}
// Without Flow
func houseFlow2() -> Observable<House> {
  flow.navigationController.push(houseNumberVC)
  return houseNumberVC.doneButton
    .flatMap{ number in
      flow.navigationController.push(houseStreetVC)
      return houseStreetVC.doneButton.map { street in (number, street) }
    }
    .map { (number, street) in House(number, street) }
}
