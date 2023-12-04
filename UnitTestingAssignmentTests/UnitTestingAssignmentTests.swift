//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by salome on 04.12.23.
//

import XCTest
@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var viewModel: CartViewModel!
    
    override func setUpWithError() throws {
        viewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    
    func testAddProduct() {
        let productToAdd = Product(id: 1, title: "TestProduct", description: "", price: 20.0, selectedQuantity: 2)
        viewModel.addProduct(product: productToAdd)
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
    }
    
    func testRemoveProduct() {
        let productToAdd = Product(id: 1, title: "TestProduct", description: "", price: 20.0, selectedQuantity: 2)
        viewModel.addProduct(product: productToAdd)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
        
        viewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 0)
    }
    
    func testTotalPrice() {
        let product1 = Product(id: 1, title: "Product1", description: "", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product2", description: "", price: 15.0, selectedQuantity: 1)
        
        viewModel.addProduct(product: product1)
        viewModel.addProduct(product: product2)
        
        XCTAssertEqual(viewModel.totalPrice, 35.0)
    }
    
    func testClearCart() {
        let product1 = Product(id: 1, title: "Product1", description: "", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product2", description: "", price: 15.0, selectedQuantity: 1)
        
        viewModel.addProduct(product: product1)
        viewModel.addProduct(product: product2)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 2)
        
        viewModel.clearCart()
        
        XCTAssertEqual(viewModel.selectedProducts.count, 0)
        XCTAssertEqual(viewModel.totalPrice, 0.0)
    }
    
    func testAddProductWithID() {
        let productID = 1
        let productToAdd = Product(id: productID, title: "TestProduct", description: "", price: 20.0, selectedQuantity: 2)
        viewModel.addProduct(product: productToAdd)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
        XCTAssertEqual(viewModel.selectedProducts.first?.id, productID)
    }
    
    func testTotalPriceWhenProductQuantityIsZero() {
        
        let product1 = Product(id: 1, title: "Product1", description: "", price: 10.0, selectedQuantity: 0)
        let product2 = Product(id: 2, title: "Product2", description: "", price: 15.0, selectedQuantity: 0)
        
        viewModel.addProduct(product: product1)
        viewModel.addProduct(product: product2)
        
        XCTAssertEqual(viewModel.totalPrice, 0.0)
    }
    
    func testTotalPriceWithMixedQuantities() {
        let product1 = Product(id: 1, title: "Product1", description: "", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product2", description: "", price: 15.0, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product3", description: "", price: 5.0, selectedQuantity: 3)
        
        viewModel.addProduct(product: product1)
        viewModel.addProduct(product: product2)
        viewModel.addProduct(product: product3)
        
        XCTAssertEqual(viewModel.totalPrice, 65.0) // 2 * 10.0 + 1 * 15.0 + 3 * 5.0 = 65.0
    }
}

