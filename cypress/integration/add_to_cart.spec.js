describe('Jungle Rails App', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products > article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products > article").should("have.length", 2);
  });

  it("Has an empty cart when it loads", () => {
    cy.get('a[href*="cart"]').contains("0")
  })
  
  it("Adds an item to the cart by clicking the Add to Cart button for a product", () => {
    cy.get('.btn[type="submit"]')
    .click({force: true})
    cy.get('a[href*="cart"]').contains("1")
  })
})