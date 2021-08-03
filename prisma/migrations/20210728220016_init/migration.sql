-- CreateTable
CREATE TABLE "Test" (
    "id" SERIAL NOT NULL,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    "DateOfBirth" TEXT,
    "Username" TEXT NOT NULL,
    "Email" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Test.Email_unique" ON "Test"("Email");
