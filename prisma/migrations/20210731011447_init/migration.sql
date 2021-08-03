/*
  Warnings:

  - You are about to drop the column `ReaderId` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the `Test` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_ReaderId_fkey";

-- DropForeignKey
ALTER TABLE "Test" DROP CONSTRAINT "Test_ReaderId_fkey";

-- AlterTable
ALTER TABLE "Book" DROP COLUMN "ReaderId";

-- DropTable
DROP TABLE "Test";
