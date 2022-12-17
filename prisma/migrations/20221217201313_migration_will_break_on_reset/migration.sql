/*
  Warnings:

  - You are about to drop the `Account` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Customer` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Account" DROP CONSTRAINT "fk_customer_id_ref_Customer";

-- DropTable
DROP TABLE "Account";

-- DropTable
DROP TABLE "Customer";

-- CreateTable
CREATE TABLE "Message" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MessageLikedUser" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "messageId" UUID NOT NULL,

    CONSTRAINT "MessageLikedUser_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MessageLikedUser" ADD CONSTRAINT "MessageLikedUser_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "Message"("id") ON DELETE CASCADE ON UPDATE CASCADE;
