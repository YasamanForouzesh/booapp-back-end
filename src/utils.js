const jwt  = require('jsonwebtoken')
const APP_SECRET = 'GraphQl-is-awws3some'

function getTokenPayload(token){

    return jwt.verify(token,APP_SECRET) 
}

function getUserId(req, authToken){
    // console.log("req:",req)
    // console.log("authToken: ",authToken)
    if(req){
        const authHeader = req.headers.authorization
        // console.log("authHeader: ",authHeader)
        if(authHeader){
            const token = authHeader.replace('Bearer','')
            if(!token){
                throw new Error('No token found')
            }
            // console.log("🍕🍕🍕🍕token: ", token)
            const {userId} = getTokenPayload(token)
            // console.log("UserID: ",userId)
            return userId;
        }
    }else if(authToken){
        const {userId} = getTokenPayload(authToken)
        return userId
    }
    throw new Error('no authentication')
}

module.exports = {
    APP_SECRET,
    getUserId
}