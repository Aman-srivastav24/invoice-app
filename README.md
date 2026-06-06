# Invoice Flow — Freelance Invoice Generator

A SaaS web application where freelancers can register, manage clients, and generate professional invoices with PDF export.

## Problem It Solves

Most invoice tools are bloated and not India-friendly. InvoiceFlow is simple, clean, and built with GST and INR in mind — targeting Indian freelancers.

## Tech Stack

### Backend
- Node.js
- Express.js
- PostgreSQL
- JWT (authentication)
- bcrypt (password hashing)
- pg (PostgreSQL client)

### Frontend (planned)
- React.js
- Tailwind CSS

## Folder Structure
backend/
├── src/
│   ├── config/
│   │   ├── db.js
│   │   └── env.js
│   ├── controllers/
│   │   ├── auth.controller.js
│   │   ├── client.controller.js
│   │   └── invoice.controller.js
│   ├── services/
│   │   ├── auth.service.js
│   │   ├── client.service.js
│   │   └── invoice.service.js
│   ├── routes/
│   │   ├── auth.routes.js
│   │   ├── client.routes.js
│   │   └── invoice.routes.js
│   ├── models/
│   │   ├── user.model.js
│   │   ├── client.model.js
│   │   └── invoice.model.js
│   ├── middleware/
│   │   ├── auth.middleware.js
│   │   └── validate.middleware.js
│   └── utils/
│       ├── jwt.js
│       └── pdf.js
├── migrations/
│   └── init.sql
├── app.js
├── server.js
├── .env
├── .env.example
├── .gitignore
└── package.json

## Database Schema

Four tables — users, clients, invoices, invoice_items.

Relationships:
- User has many Clients
- User has many Invoices
- Client has many Invoices
- Invoice has many Invoice Items


### Auth
| Method | Endpoint | Description | Protected |
|---|---|---|---|
| POST | `/api/auth/register` | Register new freelancer | No |
| POST | `/api/auth/login` | Login, returns JWT token | No |
| POST | `/api/auth/logout` | Logout | Yes |

### Clients
| Method | Endpoint | Description | Protected |
|---|---|---|---|
| POST | `/api/clients` | Create new client | Yes |
| GET | `/api/clients` | Get all clients | Yes |
| GET | `/api/clients/:id` | Get single client | Yes |
| PUT | `/api/clients/:id` | Update client | Yes |
| DELETE | `/api/clients/:id` | Delete client | Yes |

### Invoices
| Method | Endpoint | Description | Protected |
|---|---|---|---|
| POST | `/api/invoices` | Create new invoice | Yes |
| GET | `/api/invoices` | Get all invoices | Yes |
| GET | `/api/invoices/:id` | Get single invoice with items | Yes |
| PUT | `/api/invoices/:id` | Update invoice | Yes |
| DELETE | `/api/invoices/:id` | Delete invoice | Yes |
| PATCH | `/api/invoices/:id/status` | Update invoice status | Yes |
| GET | `/api/invoices/:id/pdf` | Generate and download PDF | Yes |


## Local Setup

### Prerequisites
- Node.js installed
- PostgreSQL installed

### Steps

1. Clone the repository
```bash
git clone https://github.com/yourusername/invoice-flow.git
cd invoice-flow/backend
```

2. Install dependencies
```bash
npm install
```

3. Create environment file
```bash
cp .env.example .env
```
Then fill in your values in `.env`

4. Create the database
```bash
psql -U postgres
```
```sql
CREATE DATABASE invoice_db;
\q
```

5. Run migrations
```bash
psql -U postgres -d invoice_db -f migrations/init.sql
```

6. Start the server
```bash
npm run dev
```

## API DESIGN

