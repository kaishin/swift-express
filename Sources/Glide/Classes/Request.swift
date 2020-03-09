import NIOHTTP1
import Foundation
import NIO

public final class Request {
  public let header: HTTPRequestHead
  public var body: Data? = nil
  public var userInfo = [String: Any]()
  public let eventLoop: EventLoop

  init(header: HTTPRequestHead, eventLoop: EventLoop) {
    self.header = header
    self.eventLoop = eventLoop
  }
}

public extension Request {
  func parameter(_ id: String) -> String? {
    let parameters = userInfo[requestParameterKey] as? [String: String]
    return parameters?[id]
  }
}