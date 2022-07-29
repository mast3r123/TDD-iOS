import XCTest

class CashRegister {
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal) {
        transactionTotal = cost
    }
}

class CashRegisterTest: XCTestCase {
    
    var availableFunds: Decimal!
    var sut: CashRegister!
    
    override func setUp() {
        super.setUp()
        availableFunds = Decimal(100)
        sut = CashRegister(availableFunds: availableFunds)
    }
    
    override func tearDown() {
        availableFunds = nil
        sut = nil
        super.tearDown()
    }
    
    func testInitAvailableFunds_setAvailableFunds() {
        //given
        let availableFunds = Decimal(100)
        
        //when
        let sut = CashRegister(availableFunds: availableFunds)
        
        //then
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addCostsToTransactionTotal() {
        //given
        let availableFunds = Decimal(100)
        let sut = CashRegister(availableFunds: availableFunds)
        
        let item = Decimal(42)
        
        //when
        sut.addItem(item)
        
        //then
        XCTAssertEqual(sut.transactionTotal, item)
        
    }
}

CashRegisterTest.defaultTestSuite.run()
