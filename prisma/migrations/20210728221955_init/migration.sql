/*
  Warnings:

  - You are about to alter the column `Password` on the `Test` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.

*/
-- AlterTable
ALTER TABLE "Test" ALTER COLUMN "Password" SET DATA TYPE VARCHAR(200);
