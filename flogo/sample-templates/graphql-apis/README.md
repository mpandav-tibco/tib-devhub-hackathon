# Flogo for GraphQL APIs


This demo application demonstrates how to use Flogo to create a GraphQL API that provides product information from multiple sources.

## Features

- **Flogo**: A lightweight, open-source workflow engine for building scalable and event-driven applications.
- **GraphQL**: A query language for APIs that provides a flexible and efficient way to access data.
- **Data Sources**: Simulates accessing data from different sources (e.g., product catalog, pricing, inventory) using dummy service.

## How to Use

- **Clone the repository**: `git clone https://github.com/mpandav-tibco/flogo-graphql-apis.git`
- **Install Flogo**: Get access Flogo development enviroment either VSCode Extension or TIBCO Cloud Integration - Flogo.
- **Open the project**: Open the Flogo project file (product-info.flogo) from the cloned repository.
- **Build and Run the Flogo app**: Click the "Run" button in the Flogo UI.
- **Test the API**: Use a GraphQL client (e.g., GraphiQL or Postman) to send queries and mutations to the Flogo API.

## The Applcation Implemention
The below snap shows the final implemetation of the application.

![image](https://github.com/user-attachments/assets/6093dadc-2545-4a1c-be58-6a4f64b18ec6)

## GQL Schema
Defined the GQL schema for Query and Mutation. Use below schema

```
type Product {
  id: ID!
  name: String!
  description: String
  price: Float
  available: Boolean
}

type Query {
  product(id: ID!): Product
}

type Mutation {
  upsertProduct(
    id: ID!
    name: String!
    description: String
    price: Float
    available: Boolean
  ): Product
}
```

## Example Queries

- **Get product details**
```
query {
  product(id: 11) {
    name
    price
  }
}
```
- **Create/Update product information**
```  
mutation {
  upsertProduct(id: "456", name: "New Product", price: 49.99, available: true) {
    id
    name
    price
    available
    description
  }
}
```
## Quick Testing

### Build Binary and Run the application
  
<img width="1728" alt="image" src="https://github.com/user-attachments/assets/675c0336-f408-484e-bd0e-fb639e7104e8" />

### Use Postman or your preferred tool for API Testing:
  
  - Query:
  <img width="1308" alt="image" src="https://github.com/user-attachments/assets/d8c0683b-b61b-4eb0-aeef-98fb8e854e77" />


  - Mutation:
  <img width="1308" alt="image" src="https://github.com/user-attachments/assets/7337646b-a769-49f0-b733-15c4cd2ce0be" />


### ****Enjoy exploring the power of Flogo and GraphQL!****
