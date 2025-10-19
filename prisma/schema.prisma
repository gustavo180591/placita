// This is your Prisma schema file for Placita marketplace
// Learn more about Prisma: https://prisma.io/docs

generator client {
  provider = "prisma-client-js"
  output   = "../../generated/prisma"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

// Enums
enum UserRole {
  ADMIN
  USER
  SELLER
  MODERATOR
}

enum OrderStatus {
  PENDING
  PAID
  SHIPPED
  DELIVERED
  CANCELLED
  RETURNED
  REFUNDED
}

enum ProductCondition {
  NEW
  USED_LIKE_NEW
  USED_GOOD
  USED_FAIR
}

enum ReportStatus {
  PENDING
  REVIEWED
  RESOLVED
  REJECTED
}

// Models
model User {
  id                String    @id @default(cuid())
  email             String    @unique
  name              String
  password          String
  phone             String?
  avatar            String?
  role              UserRole  @default(USER)
  isVerified        Boolean   @default(false)
  twoFactorEnabled  Boolean   @default(false)
  twoFactorSecret   String?
  rating            Float?    @default(0)
  ratingCount       Int       @default(0)
  createdAt         DateTime  @default(now())
  updatedAt         DateTime  @updatedAt
  
  // Relations
  products          Product[]  @relation("UserProducts")
  reviews           Review[]
  sentMessages      Message[]  @relation("SentMessages")
  receivedMessages  Message[]  @relation("ReceivedMessages")
  orders            Order[]
  notifications     Notification[]
  reportedIssues    Report[]   @relation("ReportedBy")
  reportsFiled      Report[]   @relation("UserReports")
  reportedByOthers  Report[]   @relation("ReportedUser")
  favorites         Favorite[]
  paymentMethods    PaymentMethod[]
  shippingAddresses Address[]
  sellerProfile     SellerProfile?
}

model SellerProfile {
  id          String   @id @default(cuid())
  userId      String   @unique
  user        User     @relation(fields: [userId], references: [id])
  description String?
  banner      String?
  rating      Float?   @default(0)
  salesCount  Int      @default(0)
  isVerified  Boolean  @default(false)
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  // Relations
  products    Product[]
  reviews     Review[]
}

model Category {
  id          String   @id @default(cuid())
  name        String   @unique
  slug        String   @unique
  description String?
  image       String?
  parentId    String?
  parent      Category?  @relation("CategoryHierarchy", fields: [parentId], references: [id])
  children    Category[] @relation("CategoryHierarchy")
  products    Product[]
  commission  Float    @default(0.1) // 10% default commission
  isActive    Boolean  @default(true)
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
}

model Product {
  id           String   @id @default(cuid())
  title        String
  slug         String   @unique
  description  String
  price        Float
  comparePrice Float?
  stock        Int
  sku          String?  @unique
  barcode      String?
  condition    ProductCondition @default(NEW)
  isPublished  Boolean  @default(false)
  isFeatured   Boolean  @default(false)
  rating       Float?   @default(0)
  ratingCount  Int      @default(0)
  viewCount    Int      @default(0)
  
  // Relations
  sellerId     String
  seller       SellerProfile @relation(fields: [sellerId], references: [id])
  owner        User?         @relation("UserProducts", fields: [ownerId], references: [id])
  ownerId      String?
  categoryId   String
  category     Category @relation(fields: [categoryId], references: [id])
  images       ProductImage[]
  variants     ProductVariant[]
  orders       OrderItem[]
  reviews      Review[]
  favorites    Favorite[]
  
  // Timestamps
  createdAt    DateTime @default(now())
  updatedAt    DateTime @updatedAt
  publishedAt  DateTime?
}

model ProductImage {
  id        String   @id @default(cuid())
  url       String
  alt       String?
  order     Int
  productId String
  product   Product  @relation(fields: [productId], references: [id], onDelete: Cascade)
  
  @@index([productId])
}

model ProductVariant {
  id        String   @id @default(cuid())
  name      String
  price     Float
  stock     Int
  sku       String?
  productId String
  product   Product  @relation(fields: [productId], references: [id], onDelete: Cascade)
  
  @@index([productId])
}

model Order {
  id          String      @id @default(cuid())
  orderNumber String      @unique
  status      OrderStatus @default(PENDING)
  subtotal    Float
  tax         Float
  shipping    Float
  total       Float
  currency    String      @default("ARS")
  notes       String?
  
  // Relations
  userId      String
  user        User        @relation(fields: [userId], references: [id])
  items       OrderItem[]
  payments    Payment[]
  shippingAddressId String
  shippingAddress Address    @relation("OrderShippingAddress", fields: [shippingAddressId], references: [id])
  billingAddressId  String
  billingAddress  Address    @relation("OrderBillingAddress", fields: [billingAddressId], references: [id])
  
  // Timestamps
  createdAt   DateTime    @default(now())
  updatedAt   DateTime    @updatedAt
  paidAt      DateTime?
  shippedAt   DateTime?
  deliveredAt DateTime?
  
  @@index([userId])
  @@index([status])
  @@index([createdAt])
}

model OrderItem {
  id                String   @id @default(cuid())
  quantity          Int
  price             Float
  variantName       String?
  
  // Relations
  orderId           String
  order             Order    @relation(fields: [orderId], references: [id], onDelete: Cascade)
  productId         String
  product           Product  @relation(fields: [productId], references: [id])
  
  @@index([orderId])
  @@index([productId])
}

model Payment {
  id              String   @id @default(cuid())
  amount          Float
  currency        String   @default("ARS")
  paymentMethod   String
  transactionId   String?
  status          String   // e.g., 'pending', 'completed', 'failed', 'refunded'
  
  // Relations
  orderId         String
  order           Order    @relation(fields: [orderId], references: [id], onDelete: Cascade)
  
  // Timestamps
  createdAt       DateTime @default(now())
  updatedAt       DateTime @updatedAt
  
  @@index([orderId])
  @@index([transactionId])
}

model Review {
  id          String   @id @default(cuid())
  rating      Int      @default(5)
  title       String?
  comment     String?
  isVerified  Boolean  @default(false)
  
  // Relations
  productId   String
  product     Product  @relation(fields: [productId], references: [id])
  userId      String
  user        User     @relation(fields: [userId], references: [id])
  sellerId    String
  seller      SellerProfile @relation(fields: [sellerId], references: [id])
  
  // Timestamps
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@index([productId])
  @@index([userId])
  @@index([sellerId])
}

model Message {
  id           String   @id @default(cuid())
  content      String
  isRead       Boolean  @default(false)
  
  // Relations
  senderId     String
  sender       User     @relation("SentMessages", fields: [senderId], references: [id])
  recipientId  String
  recipient    User     @relation("ReceivedMessages", fields: [recipientId], references: [id])
  
  // Timestamps
  createdAt    DateTime @default(now())
  
  @@index([senderId])
  @@index([recipientId])
}

model Notification {
  id          String   @id @default(cuid())
  type        String   // e.g., 'order', 'message', 'system'
  title       String
  message     String
  isRead      Boolean  @default(false)
  
  // Relations
  userId      String
  user        User     @relation(fields: [userId], references: [id])
  
  // Reference to related entity (optional)
  referenceId String?
  
  // Timestamps
  createdAt   DateTime @default(now())
  
  @@index([userId])
  @@index([isRead])
}

model Report {
  id          String   @id @default(cuid())
  type        String   // e.g., 'product', 'user', 'review'
  reason      String
  status      ReportStatus @default(PENDING)
  notes       String?
  
  // Relations
  reporterId  String
  reporter    User     @relation("ReportedBy", fields: [reporterId], references: [id])
  reportedBy  User[]   @relation("UserReports")
  
  // Add a field to track the reported user
  reportedUserId String?
  reportedUser   User?   @relation("ReportedUser", fields: [reportedUserId], references: [id])
  reportedId  String   // ID of the reported entity
  
  // Timestamps
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@index([reporterId])
  @@index([reportedId])
  @@index([reportedUserId])
  @@index([status])
}

model Favorite {
  id        String   @id @default(cuid())
  
  // Relations
  userId    String
  user      User     @relation(fields: [userId], references: [id])
  productId String
  product   Product  @relation(fields: [productId], references: [id])
  
  // Timestamps
  createdAt DateTime @default(now())
  
  @@unique([userId, productId])
  @@index([userId])
  @@index([productId])
}

model PaymentMethod {
  id            String   @id @default(cuid())
  type          String   // e.g., 'credit_card', 'debit_card', 'mercadopago'
  provider      String
  accountNumber String?
  expiryDate    String?
  isDefault     Boolean  @default(false)
  
  // Relations
  userId        String
  user          User     @relation(fields: [userId], references: [id])
  
  // Timestamps
  createdAt     DateTime @default(now())
  updatedAt     DateTime @updatedAt
  
  @@index([userId])
}

model Address {
  id          String   @id @default(cuid())
  firstName   String
  lastName    String
  address1    String
  address2    String?
  city        String
  province    String
  postalCode  String
  country     String   @default("Argentina")
  phone       String?
  isDefault   Boolean  @default(false)
  
  // Relations
  userId      String
  user        User     @relation(fields: [userId], references: [id])
  orderShippingAddresses Order[] @relation("OrderShippingAddress")
  orderBillingAddresses  Order[] @relation("OrderBillingAddress")
  
  // Timestamps
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@index([userId])
}

// For admin dashboard metrics
model SiteMetric {
  id          String   @id @default(cuid())
  date        DateTime @default(now())
  totalUsers  Int      @default(0)
  totalOrders Int      @default(0)
  totalSales  Float    @default(0)
  
  @@index([date])
}
