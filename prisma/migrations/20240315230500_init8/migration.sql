/*
  Warnings:

  - You are about to drop the `_id` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_id";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "_uid" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_uid_A_fkey" FOREIGN KEY ("A") REFERENCES "Attachments" ("file") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_uid_B_fkey" FOREIGN KEY ("B") REFERENCES "Processed" ("uid") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_uid_AB_unique" ON "_uid"("A", "B");

-- CreateIndex
CREATE INDEX "_uid_B_index" ON "_uid"("B");
