import XCTest

class CashRegister {
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }
    
    func acceptCashPayment(_ payment: Decimal) {
        transactionTotal -= payment
        availableFunds += payment
    }
}

class CashRegisterTest: XCTestCase {
    
    var availableFunds: Decimal!
    var sut: CashRegister!
    var item: Decimal!
    
    override func setUp() {
        super.setUp()
        availableFunds = Decimal(100)
        sut = CashRegister(availableFunds: availableFunds)
        item = Decimal(42)
    }
    
    override func tearDown() {
        availableFunds = nil
        sut = nil
        item = nil
        super.tearDown()
    }
    
    func testInitAvailableFunds_setAvailableFunds() {
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addCostsToTransactionTotal() {
        
        //when
        sut.addItem(item)
        
        //then
        XCTAssertEqual(sut.transactionTotal, item)
        
    }
    
    func testAddItem_twoItem_addCostsToTransactionTotal() {
        //given
        let itemTwo = Decimal(100)
        let expectedTotal = item + itemTwo
        
        //when
        sut.addItem(item)
        sut.addItem(itemTwo)
        
        //then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }
    
    //Challenge
    func testAcceptCashPayment_subtractCostToTransactionTotal() {
        
        //given
        beginTransaction()        
        let payment = Decimal(140)
        let expected = sut.transactionTotal - payment
        
        //when
        sut.acceptCashPayment(payment)
        
        //then
        XCTAssertEqual(sut.transactionTotal, expected)
    }
    
    func testAcceptCashPayment_addCostToAvailableFundsTotal() {
        //given
        beginTransaction()
        let payment = Decimal(140)
        let expected = sut.availableFunds + payment
        
        //when
        sut.acceptCashPayment(payment)
        
        //then
        XCTAssertEqual(sut.availableFunds, expected)
    }
    
    func beginTransaction() {
        sut.addItem(100)
        sut.addItem(50)
    }
}

CashRegisterTest.defaultTestSuite.run()
