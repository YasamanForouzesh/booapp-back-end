/*
  Warnings:

  - A unique constraint covering the columns `[TestID]` on the table `UserBookFave` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `TestID` to the `UserBookFave` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "UserBookFave" ADD COLUMN     "TestID" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "UserBookFave_TestID_unique" ON "UserBookFave"("TestID");

-- AddForeignKey
ALTER TABLE "UserBookFave" ADD FOREIGN KEY ("TestID") REFERENCES "Test"("id") ON DELETE CASCADE ON UPDATE CASCADE;
