-- CreateTable
CREATE TABLE "Processed" (
    "uid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME NOT NULL,
    "fromname" TEXT,
    "from" TEXT,
    "subject" TEXT
);

-- CreateTable
CREATE TABLE "Attachments" (
    "file" TEXT NOT NULL,
    "processedUid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    CONSTRAINT "Attachments_processedUid_fkey" FOREIGN KEY ("processedUid") REFERENCES "Processed" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE
);
