-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Attachments" (
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "file" TEXT NOT NULL,
    "processedId" INTEGER NOT NULL,
    CONSTRAINT "Attachments_processedId_fkey" FOREIGN KEY ("processedId") REFERENCES "Processed" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Attachments" ("file", "id", "processedId") SELECT "file", "id", "processedId" FROM "Attachments";
DROP TABLE "Attachments";
ALTER TABLE "new_Attachments" RENAME TO "Attachments";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
