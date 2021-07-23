-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    "DateOfBirth" TEXT NOT NULL,
    "Username" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Password" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Book" (
    "id" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Author" TEXT NOT NULL,
    "PicUrl" TEXT NOT NULL,
    "Summery" TEXT NOT NULL,
    "ReaderId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserBookFave" (
    "id" SERIAL NOT NULL,
    "UserID" INTEGER NOT NULL,
    "BookID" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Comments" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "BookID" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vote" (
    "id" SERIAL NOT NULL,
    "CommentID" INTEGER NOT NULL,
    "Count" SERIAL NOT NULL,
    "UserID" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User.Email_unique" ON "User"("Email");

-- CreateIndex
CREATE UNIQUE INDEX "UserBookFave_UserID_unique" ON "UserBookFave"("UserID");

-- CreateIndex
CREATE UNIQUE INDEX "UserBookFave_BookID_unique" ON "UserBookFave"("BookID");

-- AddForeignKey
ALTER TABLE "Book" ADD FOREIGN KEY ("ReaderId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserBookFave" ADD FOREIGN KEY ("UserID") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserBookFave" ADD FOREIGN KEY ("BookID") REFERENCES "Book"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comments" ADD FOREIGN KEY ("BookID") REFERENCES "Book"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vote" ADD FOREIGN KEY ("CommentID") REFERENCES "Comments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vote" ADD FOREIGN KEY ("UserID") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
