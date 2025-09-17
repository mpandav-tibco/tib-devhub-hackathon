# ${{ values.name }}

${{ values.description }}

## Flogo GraphQL API Project

This project contains a TIBCO Flogo application that implements GraphQL APIs for product data management.

### Features

- GraphQL schema definition for product queries
- Product API with flexible data querying
{%- if values.enableMutation %}
- GraphQL mutations for data modification
{%- endif %}
{%- if values.enableSubscription %}
- Real-time GraphQL subscriptions
{%- endif %}
- Integration with multiple data sources

### Configuration

- API Port: ${{ values.apiPort }}
- Owner: ${{ values.owner }}
{%- if values.system %}
- System: ${{ values.system }}
{%- endif %}

### Files

- `product-api.flogo`: Main Flogo application file
- `product-api.flogotest`: Test configuration for the Flogo application
- `product.gql`: GraphQL schema definition

### Getting Started

1. Import the `.flogo` file into TIBCO Flogo Enterprise
2. Configure the GraphQL endpoints as needed
3. Build and deploy the application
4. Test the GraphQL API using the provided schema

### Documentation

For more information about TIBCO Flogo and GraphQL development, see:
- [TIBCO Flogo Enterprise Documentation](https://docs.tibco.com/products/tibco-flogo-enterprise)
- [GraphQL Documentation](https://graphql.org/learn/)