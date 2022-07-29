import XCTest

class CashRegister {
    var availableFunds: Decimal
    
    init(availableFunds: Decimal = 0) {
        self.availableFunds = availableFunds
    }
}

class CashRegisterTest: XCTestCase {
    func testInit_createsCashRegister() {
        XCTAssertNotNil(CashRegister())
    }
    
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
