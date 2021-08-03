/*
  Warnings:

  - A unique constraint covering the columns `[TBookID]` on the table `UserBookFave` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `TBookID` to the `Comments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `TBookID` to the `UserBookFave` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Comments" ADD COLUMN     "TBookID" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "UserBookFave" ADD COLUMN     "TBookID" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Test" (
    "id" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Summery" TEXT NOT NULL,
    "Author" TEXT NOT NULL,
    "ReaderId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserBookFave_TBookID_unique" ON "UserBookFave"("TBookID");

-- AddForeignKey
ALTER TABLE "Test" ADD FOREIGN KEY ("ReaderId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserBookFave" ADD FOREIGN KEY ("TBookID") REFERENCES "Test"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comments" ADD FOREIGN KEY ("TBookID") REFERENCES "Test"("id") ON DELETE CASCADE ON UPDATE CASCADE;
