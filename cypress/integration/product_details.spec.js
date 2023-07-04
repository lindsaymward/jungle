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

  it("Should load the product details page when you click on the image", () => {
    cy.get(".products > article")
      .first()
      .click()
    cy.get(".product-detail").should('be.visible')
  })
})