/*
  Warnings:

  - You are about to drop the `_aaa` table. If the table is not empty, all the data it contains will be lost.
  - The primary key for the `Attachments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `id` to the `Attachments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `processedId` to the `Attachments` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "_aaa_B_index";

-- DropIndex
DROP INDEX "_aaa_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_aaa";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Attachments" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "file" TEXT NOT NULL,
    "processedId" INTEGER NOT NULL,
    CONSTRAINT "Attachments_processedId_fkey" FOREIGN KEY ("processedId") REFERENCES "Processed" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Attachments" ("file") SELECT "file" FROM "Attachments";
DROP TABLE "Attachments";
ALTER TABLE "new_Attachments" RENAME TO "Attachments";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
