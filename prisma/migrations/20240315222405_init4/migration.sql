-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Attachments" (
    "file" TEXT NOT NULL,
    "processedUid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    CONSTRAINT "Attachments_processedUid_fkey" FOREIGN KEY ("processedUid") REFERENCES "Processed" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Attachments" ("file", "processedUid") SELECT "file", "processedUid" FROM "Attachments";
DROP TABLE "Attachments";
ALTER TABLE "new_Attachments" RENAME TO "Attachments";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
