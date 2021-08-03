/*
  Warnings:

  - Added the required column `TesterId` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Book" ADD COLUMN     "TesterId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Book" ADD FOREIGN KEY ("TesterId") REFERENCES "Test"("id") ON DELETE CASCADE ON UPDATE CASCADE;
