/*
  Warnings:

  - You are about to drop the column `processedUid` on the `Attachments` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "_aaa" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_aaa_A_fkey" FOREIGN KEY ("A") REFERENCES "Attachments" ("file") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_aaa_B_fkey" FOREIGN KEY ("B") REFERENCES "Processed" ("uid") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Attachments" (
    "file" TEXT NOT NULL PRIMARY KEY
);
INSERT INTO "new_Attachments" ("file") SELECT "file" FROM "Attachments";
DROP TABLE "Attachments";
ALTER TABLE "new_Attachments" RENAME TO "Attachments";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_aaa_AB_unique" ON "_aaa"("A", "B");

-- CreateIndex
CREATE INDEX "_aaa_B_index" ON "_aaa"("B");
