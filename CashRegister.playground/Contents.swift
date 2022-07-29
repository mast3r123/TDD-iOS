import XCTest

class CashRegister {
    var availableFunds: Decimal
    
    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
}

class CashRegisterTest: XCTestCase {
    
    func testInitAvailableFunds_setAvailableFunds() {
        //given
        let availableFunds = Decimal(100)
        
        //when
        let sut = CashRegister(availableFunds: availableFunds)
        
        //then
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
}

CashRegisterTest.defaultTestSuite.run()
