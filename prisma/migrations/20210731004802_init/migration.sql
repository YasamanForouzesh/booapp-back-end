-- CreateTable
CREATE TABLE "Test" (
    "id" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Summery" TEXT NOT NULL,
    "Author" TEXT NOT NULL,
    "ReaderId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Test" ADD FOREIGN KEY ("ReaderId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
