const { prisma } = require('@prisma/client')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const { APP_SECRET, getUserId } = require('../utils')
const axios = require('axios')
async function Login(parent,args,context,info){
    console.log(context)
    const user = await context.prisma.user.findUnique({where: {Email: args.Email}})
    if(!user){
        throw new Error('No such user found')
    }
    const validation = await bcrypt.compare(args.Password,user.Password)
    if(!validation){
        throw new Error("Invalid password")
    }
    const token = jwt.sign({userId: user.id}, APP_SECRET)
    return{
        token,
        user,
    }
}
async function AddBook(parent,args,context,info){
    const {UserId} = context
    const result = await axios.get(`https://openlibrary.org/search.json?q=${args.Name}`)
    const data = result.data.docs[0]
    console.log("🍤🍤🍣🍣🦪🦪🍜")
    console.log(UserId)
    const urlPic= `http://covers.openlibrary.org/b/id/${data.cover_i}-L.jpg`
    const Book = await context.prisma.book.create({
        data:{
            Name : "test",
            Summery : "This is for test",
            Author: data.author_name[0],
            PicUrl : urlPic,
            Reader : {connect :{id : UserId}}
    }})

    return "it's done"
}
async function Signup(parent,args,context,info){
    const Password = await bcrypt.hash(args.Password,10)
    const user = await context.prisma.user.create({data:{...args,Password}})
    const token = jwt.sign({userId: user.id}, APP_SECRET)
    console.log("token:",token)
    console.log("user:",user)
    return {
        token,
        user,
    }
}
module.exports = {
    Signup,
    Login,
    AddBook
    
}