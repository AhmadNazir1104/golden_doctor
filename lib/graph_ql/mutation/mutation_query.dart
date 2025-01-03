String signUpMutationQuery = """
  mutation customerCreate(\$input: CustomerCreateInput!) {
  customerCreate(input: \$input) {
    customer {
      email, 
      password, 
      firstName, 
      lastName,
      password
      acceptsMarketing,
    }
    customerUserErrors {
      code
      message
    }
  }
}
""";

String checkoutmutationwithemail() {
  return """
mutation customerCheckout(\$Checkoutitems : [CheckoutLineItemInput!],\$email : String)
{
  checkoutCreate(input: {
    lineItems: \$Checkoutitems, email : \$email
  }) {
    checkout {
      id
      webUrl
      lineItems(first: 5) {
         edges {
          node {
             title
             quantity
          }
         }
      }
    }
  }
}
""";
}
