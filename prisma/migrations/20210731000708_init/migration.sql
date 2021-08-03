/*
  Warnings:

  - You are about to drop the column `TesterId` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `TestID` on the `UserBookFave` table. All the data in the column will be lost.
  - You are about to drop the column `TesterID` on the `Vote` table. All the data in the column will be lost.
  - You are about to drop the `Test` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_TesterId_fkey";

-- DropForeignKey
ALTER TABLE "UserBookFave" DROP CONSTRAINT "UserBookFave_TestID_fkey";

-- DropForeignKey
ALTER TABLE "Vote" DROP CONSTRAINT "Vote_TesterID_fkey";

-- DropIndex
DROP INDEX "UserBookFave_TestID_unique";

-- AlterTable
ALTER TABLE "Book" DROP COLUMN "TesterId";

-- AlterTable
ALTER TABLE "UserBookFave" DROP COLUMN "TestID";

-- AlterTable
ALTER TABLE "Vote" DROP COLUMN "TesterID";

-- DropTable
DROP TABLE "Test";
