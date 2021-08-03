/*
  Warnings:

  - You are about to alter the column `Password` on the `Test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(200)` to `VarChar(100)`.

*/
-- AlterTable
ALTER TABLE "Test" ALTER COLUMN "Password" SET DATA TYPE VARCHAR(100);
