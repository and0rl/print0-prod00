/*
  Warnings:

  - You are about to drop the `_uid` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "_uid_B_index";

-- DropIndex
DROP INDEX "_uid_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_uid";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Attachments" (
    "file" TEXT NOT NULL PRIMARY KEY,
    "processedUid" INTEGER,
    CONSTRAINT "Attachments_processedUid_fkey" FOREIGN KEY ("processedUid") REFERENCES "Processed" ("uid") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Attachments" ("file") SELECT "file" FROM "Attachments";
DROP TABLE "Attachments";
ALTER TABLE "new_Attachments" RENAME TO "Attachments";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
