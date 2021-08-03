/*
  Warnings:

  - You are about to drop the column `TBookID` on the `Comments` table. All the data in the column will be lost.
  - You are about to drop the column `TBookID` on the `UserBookFave` table. All the data in the column will be lost.
  - You are about to drop the `Test` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Comments" DROP CONSTRAINT "Comments_TBookID_fkey";

-- DropForeignKey
ALTER TABLE "Test" DROP CONSTRAINT "Test_ReaderId_fkey";

-- DropForeignKey
ALTER TABLE "UserBookFave" DROP CONSTRAINT "UserBookFave_TBookID_fkey";

-- DropIndex
DROP INDEX "UserBookFave_TBookID_unique";

-- AlterTable
ALTER TABLE "Comments" DROP COLUMN "TBookID";

-- AlterTable
ALTER TABLE "UserBookFave" DROP COLUMN "TBookID";

-- DropTable
DROP TABLE "Test";
