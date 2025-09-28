/*
  Warnings:

  - The primary key for the `Attachments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `processedUid` on the `Attachments` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "_id" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_id_A_fkey" FOREIGN KEY ("A") REFERENCES "Attachments" ("file") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_id_B_fkey" FOREIGN KEY ("B") REFERENCES "Processed" ("uid") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Attachments" (
    "file" TEXT NOT NULL PRIMARY KEY
);
INSERT INTO "new_Attachments" ("file") SELECT "file" FROM "Attachments";
DROP TABLE "Attachments";
ALTER TABLE "new_Attachments" RENAME TO "Attachments";
CREATE UNIQUE INDEX "Attachments_file_key" ON "Attachments"("file");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_id_AB_unique" ON "_id"("A", "B");

-- CreateIndex
CREATE INDEX "_id_B_index" ON "_id"("B");
