import Foundation

infix operator ≥

public func ≥<T>(left: @escaping (T) -> (), queue: DispatchQueue) -> (T) -> () {
  return { input in
    queue.async { left(input) }
  }
}

