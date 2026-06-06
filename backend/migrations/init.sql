CREATE TABLE users (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name        VARCHAR(255) NOT NULL,
  last_name         VARCHAR(255) NOT NULL,
  email             VARCHAR(255) UNIQUE NOT NULL,
  password_hash     VARCHAR(255) NOT NULL,
  business_name     VARCHAR(255),
  phone             VARCHAR(20),
  created_at        TIMESTAMP DEFAULT NOW(),
  updated_at        TIMESTAMP DEFAULT NOW()
);

CREATE TABLE clients (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id           UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  client_name       VARCHAR(255) NOT NULL,
  company_name      VARCHAR(255),
  email             VARCHAR(255) NOT NULL,
  phone             VARCHAR(20),
  billing_address   TEXT NOT NULL,
  gst_no            VARCHAR(50),
  pan_no            VARCHAR(50),
  created_at        TIMESTAMP DEFAULT NOW()
);

CREATE TABLE invoices (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id           UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  client_id         UUID NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
  invoice_number    VARCHAR(50) NOT NULL,
  currency          VARCHAR(10) NOT NULL DEFAULT 'INR',
  status            VARCHAR(20) NOT NULL DEFAULT 'draft',
  invoice_date      DATE NOT NULL,
  due_date          DATE NOT NULL,
  subtotal          DECIMAL(10,2) NOT NULL DEFAULT 0,
  tax_percent       DECIMAL(5,2) NOT NULL DEFAULT 18.00,
  tax_amount        DECIMAL(10,2) NOT NULL DEFAULT 0,
  discount          DECIMAL(10,2) NOT NULL DEFAULT 0,
  total             DECIMAL(10,2) NOT NULL DEFAULT 0,
  notes             TEXT,
  created_at        TIMESTAMP DEFAULT NOW(),
  updated_at        TIMESTAMP DEFAULT NOW()
);

CREATE TABLE invoice_items (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id        UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
  description       VARCHAR(255) NOT NULL,
  qty               INT NOT NULL DEFAULT 1,
  unit_price        DECIMAL(10,2) NOT NULL,
  amount            DECIMAL(10,2) NOT NULL
);