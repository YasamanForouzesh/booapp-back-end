/*
  Warnings:

  - Added the required column `ReaderId` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Book" ADD COLUMN     "ReaderId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Test" (
    "id" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Summery" TEXT NOT NULL,
    "Author" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Book" ADD FOREIGN KEY ("ReaderId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
