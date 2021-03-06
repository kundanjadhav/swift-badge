import XCTest
import BadgeSwift

class BadgeSwiftTests: XCTestCase {
  
  var badge: BadgeSwift!
  
  override func setUp() {
    super.setUp()
    badge = BadgeSwift(frame: CGRect(origin: CGPoint(), size: CGSize(width: 10, height: 10)))
  }

  func testCalculateTextRectangle() {
    badge.text = "Hello"
    badge.font = UIFont.systemFont(ofSize: 12)
    badge.insets = CGSize(width: 13, height: 17)
    badge.borderWidth = 3
    let initialRect = CGRect(origin: CGPoint(), size: CGSize(width: 100, height: 60))
    
    let rect = badge.textRect(forBounds: initialRect, limitedToNumberOfLines: 1)
    
    XCTAssertEqual(61.0, rect.width)
    XCTAssertEqual(54.5, rect.height)
  }
  
  func testCalculateTextRectangle_widthLessThanHeight() {
    badge.text = "Hello"
    badge.font = UIFont.systemFont(ofSize: 12)
    badge.insets = CGSize(width: 2, height: 17)
    badge.borderWidth = 3
    let initialRect = CGRect(origin: CGPoint(), size: CGSize(width: 30, height: 60))
    
    let rect = badge.textRect(forBounds: initialRect, limitedToNumberOfLines: 1)
    
    XCTAssertEqual(54.5, rect.width)
    XCTAssertEqual(54.5, rect.height)
  }
  
  func testCenteredByDefault() {
    XCTAssertEqual(NSTextAlignment.center, badge.textAlignment)
  }
  
  func testDoNotClipToBoundsByDefault() {
    XCTAssertFalse(badge.clipsToBounds)
  }
  
  func testSetShadowOpacity() {
    badge.shadowOpacityBadge = 0.31
    
    XCTAssertEqual(0.31, badge.layer.shadowOpacity)
  }
  
  func testSetShadowRadius() {
    badge.shadowRadiusBadge = 0.32
    
    XCTAssertEqual(0.32, badge.layer.shadowRadius)
  }
  
  func testSetShadowColor() {
    badge.shadowColorBadge = UIColor.purple()
    
    XCTAssertEqual(UIColor.purple(), UIColor(cgColor: badge.layer.shadowColor!))
  }
  
  func testSetShadowOffset() {
    badge.shadowOffsetBadge = CGSize(width: 34, height: 52)
    
    XCTAssertEqual(CGSize(width: 34, height: 52), badge.layer.shadowOffset)
  }
}
