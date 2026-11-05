-- ============================================================
-- Ejemplo SQL DDL (PostgreSQL) para probar importación en ERD Studio
-- ============================================================

CREATE TYPE "OrderStatus" AS ENUM ('PENDING', 'PAID', 'SHIPPED', 'CANCELLED');

CREATE TABLE "Customer" (
  "id" SERIAL NOT NULL,
  "email" VARCHAR(255) NOT NULL UNIQUE,
  "fullName" VARCHAR(255) NOT NULL,
  "phone" VARCHAR(255),
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE "Category" (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(255) NOT NULL UNIQUE,
  "slug" VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY ("id")
);

CREATE TABLE "Product" (
  "id" SERIAL NOT NULL,
  "categoryId" INT NOT NULL,
  "sku" VARCHAR(255) NOT NULL UNIQUE,
  "name" VARCHAR(255) NOT NULL,
  "price" DECIMAL(12, 2) NOT NULL,
  "stock" INT NOT NULL DEFAULT 0,
  "isActive" BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY ("id")
);

CREATE TABLE "Order" (
  "id" SERIAL NOT NULL,
  "customerId" INT NOT NULL,
  "status" "OrderStatus" NOT NULL DEFAULT 'PENDING',
  "total" DECIMAL(12, 2) NOT NULL,
  "placedAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE "OrderItem" (
  "id" SERIAL NOT NULL,
  "orderId" INT NOT NULL,
  "productId" INT NOT NULL,
  "quantity" INT NOT NULL DEFAULT 1,
  "unitPrice" DECIMAL(12, 2) NOT NULL,
  PRIMARY KEY ("id")
);

ALTER TABLE "Product" ADD CONSTRAINT "fk_Product_categoryId" FOREIGN KEY ("categoryId") REFERENCES "Category" ("id");
ALTER TABLE "Order" ADD CONSTRAINT "fk_Order_customerId" FOREIGN KEY ("customerId") REFERENCES "Customer" ("id");
ALTER TABLE "OrderItem" ADD CONSTRAINT "fk_OrderItem_orderId" FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON DELETE CASCADE;
ALTER TABLE "OrderItem" ADD CONSTRAINT "fk_OrderItem_productId" FOREIGN KEY ("productId") REFERENCES "Product" ("id");
