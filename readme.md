Installation:

- npm install apollo-server graphql

create grapgql file:

- touch schema.graphql

resolvers like controllers in Rest API:

- for each type field we need resolver
- we need to bound our resovler by graphql schema :
  `const server = new ApolloServer({ typeDefs:fs.reeadFileSync( path.join(__dirname,'schema.graphql'), 'utf8' ), resolvers })`

  operation types:

- Query --> read data from server
- Mutation --> update/creating/deleting
- Subscription --> Realtime Update

Database:

Installation:

- npm install prisma typescript ts-node @types/node --save-dev

* npm install @prisma/client

#### After the installation, prisma folder will be created that hae schema.prisma file. schema.prisma file contain db url and models.

Link of db should be : postgresql://USER:PASSWORD@HOST:PORT/DATABASE?schema=SCHEMA

To map your data model to the database schema, you need to use the prisma migrate CLI commands:

- npx prisma migrate dev --name init

Attributes modify the behavior of fields or model blocks like @id, @default
Example: `isAdmin Boolean @default(false) // short form of @default(value: false)`

#### Relation fields define connections between models at the Prisma level and do not exist in the database. These fields are used to generate the Prisma Client.

Tto create the databse in postsql :
`npx prisma migrate dev --name "init" --preview-feature`
