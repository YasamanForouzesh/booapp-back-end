const { ApolloServer } = require("apollo-server");
const fs = require('fs')
const path = require('path')
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
const resolvers = {
    Query: {
        info: () => "this is just for test"
    }
}
const server = new ApolloServer({
    typeDefs:fs.readFileSync(
        path.join(__dirname,'schema.graphql'),
        'utf8'
    ),
    resolvers,
    context:{
        prisma,
    }
})

server.listen()
.then(({url})=>console.log('Server is running' + url))
    