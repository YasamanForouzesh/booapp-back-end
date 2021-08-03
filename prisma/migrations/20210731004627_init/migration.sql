/*
  Warnings:

  - You are about to drop the column `ReaderId` on the `Test` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Test" DROP CONSTRAINT "Test_ReaderId_fkey";

-- AlterTable
ALTER TABLE "Test" DROP COLUMN "ReaderId";
