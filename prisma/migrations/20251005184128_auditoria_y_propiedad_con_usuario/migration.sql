-- AlterTable
ALTER TABLE "AjusteStock" ADD COLUMN     "registradoPorId" TEXT;

-- AlterTable
ALTER TABLE "Cliente" ADD COLUMN     "creadoPorId" TEXT,
ADD COLUMN     "ownerId" TEXT;

-- AlterTable
ALTER TABLE "Compra" ADD COLUMN     "registradoPorId" TEXT;

-- AlterTable
ALTER TABLE "Precio" ADD COLUMN     "creadoPorId" TEXT;

-- AlterTable
ALTER TABLE "Producto" ADD COLUMN     "creadoPorId" TEXT,
ADD COLUMN     "ownerId" TEXT;

-- AlterTable
ALTER TABLE "Reserva" ADD COLUMN     "registradoPorId" TEXT;

-- AlterTable
ALTER TABLE "Venta" ADD COLUMN     "registradoPorId" TEXT;

-- CreateIndex
CREATE INDEX "AjusteStock_registradoPorId_idx" ON "AjusteStock"("registradoPorId");

-- CreateIndex
CREATE INDEX "Cliente_creadoPorId_idx" ON "Cliente"("creadoPorId");

-- CreateIndex
CREATE INDEX "Cliente_ownerId_idx" ON "Cliente"("ownerId");

-- CreateIndex
CREATE INDEX "Compra_registradoPorId_idx" ON "Compra"("registradoPorId");

-- CreateIndex
CREATE INDEX "Precio_creadoPorId_idx" ON "Precio"("creadoPorId");

-- CreateIndex
CREATE INDEX "Producto_creadoPorId_idx" ON "Producto"("creadoPorId");

-- CreateIndex
CREATE INDEX "Producto_ownerId_idx" ON "Producto"("ownerId");

-- CreateIndex
CREATE INDEX "Reserva_registradoPorId_idx" ON "Reserva"("registradoPorId");

-- CreateIndex
CREATE INDEX "Venta_registradoPorId_idx" ON "Venta"("registradoPorId");

-- AddForeignKey
ALTER TABLE "Producto" ADD CONSTRAINT "Producto_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Producto" ADD CONSTRAINT "Producto_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Precio" ADD CONSTRAINT "Precio_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compra" ADD CONSTRAINT "Compra_registradoPorId_fkey" FOREIGN KEY ("registradoPorId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_registradoPorId_fkey" FOREIGN KEY ("registradoPorId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reserva" ADD CONSTRAINT "Reserva_registradoPorId_fkey" FOREIGN KEY ("registradoPorId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AjusteStock" ADD CONSTRAINT "AjusteStock_registradoPorId_fkey" FOREIGN KEY ("registradoPorId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;
