const { ApolloServer } = require("apollo-server");
const fs = require('fs')
const path = require('path')
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
const {getUserId} = require('./utils')
const Query = require("./resolvers/query")
const Mutation = require('./resolvers/mutation')
// const resolvers = {
//     Query: {
//         info: (parent,args,context,info) =>{ 
//             const x = context.test
//             return x
//         }
//     }
// }
const resolvers = {
    Query,
    Mutation
}
const server = new ApolloServer({
    
    typeDefs:fs.readFileSync(
        path.join(__dirname,'schema.graphql'),
        'utf8'
    ),
    resolvers,
    context:({req})=>{
        return{
            prisma,
            UserId: req && req.headers.authorization 
            ? getUserId(req) 
            : null
        }
    }
})
// const server= new ApolloServer({    
//     typeDefs:fs.readFileSync(
//     path.join(__dirname,'schema.graphql'),
//     'utf8'
//     ),
//     resolvers,
//     context:({req})=>{
//         console.log("🍕🍕🍔🍔🍕🍕🌭🍟🍟🍔")
//         console.log(req.headers.authorization)
//         return {
//             prisma,
//             test: req
//         }
//     }
// })
console.log(server)
server.listen()
.then(({url})=>console.log('Server is running' + url))
    