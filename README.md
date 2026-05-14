## XRComm GRPC License Admin

> Enterprise-grade license management for XRComm GRPC products powered by Keygen Community Edition

<div class="badges" style="text-align: center; margin-top: -10px;">
<a href="https://github.com/themaximalist/keygen-admin"><img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/themaximalist/keygen-admin"></a>
<a href="https://github.com/themaximalist/keygen-admin"><img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/themaximalist/keygen-admin"></a>
<a href="https://github.com/themaximalist/keygen-admin"><img alt="GitHub License" src="https://img.shields.io/github/license/themaximalist/keygen-admin"></a>
</div>

**XRComm License Admin** is a modern web dashboard for managing product licenses in a self-hosted Keygen Community Edition instance. Create products, define licensing policies, and issue unique license keys to your customers with a sleek, intuitive interface.

## Features

- 🏢 **Product Management** - Create and manage multiple XRComm product offerings
- 📋 **Policy Configuration** - Define license terms, duration, machine limits, and validation strategies
- 🔑 **License Generation** - Issue unique license keys with customer email tracking
- 🔒 **Enterprise Auth** - HTTP Basic Authentication for dashboard access
- 🐳 **Docker Ready** - Production-grade Dockerfile and docker-compose for containerized deployment
- 📊 **Real-time Dashboard** - Track all licenses and customer activations at a glance
- 🎨 **Modern UI** - Built with Tailwind CSS, responsive design on all devices

## Prerequisites

- Node.js 18+ or Docker
- Self-hosted Keygen Community Edition instance
- Keygen account credentials with API access

## Local Development Setup

### 1. Clone and Install

```bash
git clone https://github.com/themaximalist/keygen-admin.git
cd keygen-admin
npm install
```

### 2. Configure Environment

```bash
cp .env.example .env
```

Edit `.env` with your Keygen instance details:

```env
KEYGEN_BASE_URL=http://localhost:8000
KEYGEN_ACCOUNT_ID=your-account-id
KEYGEN_ACCOUNT_EMAIL=admin@example.com
KEYGEN_ACCOUNT_PASSWORD=your-keygen-password
SITE_USER=admin
SITE_PASSWORD=your-secure-password
```

### 3. Start Development Server

```bash
npm run dev
```

This runs both the Node server and Tailwind CSS watcher. Visit `http://localhost:3000`

### 4. Build CSS for Production

```bash
npm run build
```

## Docker Deployment

### Quick Start with docker-compose

```bash
# Create .env file with your configuration
cp .env.example .env
# Edit .env with your Keygen credentials

# Start the container
docker-compose up -d

# Access at http://localhost:3000
```

### Build and Run Manually

```bash
# Build image
docker build -t xrcomm-license-admin .

# Run container
docker run -d \
  -p 3000:3000 \
  -e KEYGEN_BASE_URL=http://keygen:8000 \
  -e KEYGEN_ACCOUNT_ID=your-id \
  -e KEYGEN_ACCOUNT_EMAIL=admin@example.com \
  -e KEYGEN_ACCOUNT_PASSWORD=password \
  -e SITE_USER=admin \
  -e SITE_PASSWORD=secure-password \
  --name xrcomm-license-admin \
  xrcomm-license-admin
```

## Usage

### Basic Workflow

1. **Navigate to Dashboard** - Access at `/` after authentication
2. **Create a Product** - Go to Products > Add Product, enter name
3. **Define License Policies** - In product details, create policies with your licensing terms
4. **Issue Licenses** - Generate unique keys for customers, tracked by email
5. **Monitor Usage** - View all issued licenses and their validation status

### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `KEYGEN_BASE_URL` | ✓ | URL to self-hosted Keygen CE instance |
| `KEYGEN_ACCOUNT_ID` | ✓ | Keygen account ID |
| `KEYGEN_ACCOUNT_EMAIL` | ✓ | Keygen account email |
| `KEYGEN_ACCOUNT_PASSWORD` | ✓ | Keygen account password |
| `SITE_USER` | ✓ | Admin dashboard username |
| `SITE_PASSWORD` | ✓ | Admin dashboard password |
| `PORT` | - | Server port (default: 3000) |
| `NODE_ENV` | - | Environment (development/production) |
| `POSTMARK_API_KEY` | - | For email license delivery |
| `POSTMARK_FROM_EMAIL` | - | Sender email for license emails |
| `PADDLE_API_KEY` | - | For Paddle webhook integration |
| `PADDLE_WEBHOOK_SECRET` | - | Paddle webhook signing secret |
| `PRODUCT_POLICY_MAPPING` | - | JSON mapping of Paddle products to Keygen policies |

## API Integration

This admin panel uses the Keygen.js library for API communication:

```javascript
import Keygen from "@themaximalist/keygen.js"

const keygen = new Keygen({
    account_id: process.env.KEYGEN_ACCOUNT_ID,
    base_url: process.env.KEYGEN_BASE_URL,
});
```

For more details, see [Keygen.js documentation](https://github.com/themaximalist/keygen.js)

## Technology Stack

- **Framework**: Express.js 4.22+
- **Frontend**: EJS templates with Tailwind CSS 4.3
- **Styling**: Tailwind CSS with custom design system
- **License Management**: Keygen Community Edition
- **Containerization**: Docker & docker-compose
- **Development**: Nodemon for auto-reload, Hummingbird.js for routing

## Project Structure

```
.
├── src/
│   ├── index.js              # Entry point
│   ├── keygen.js             # Keygen client config
│   ├── api_key.js            # Token management
│   ├── middleware.js         # Express middleware
│   ├── mail.js               # Email service
│   ├── app.css               # Tailwind styles
│   └── controllers/          # Route handlers
├── views/                    # EJS templates
│   ├── index.ejs             # Dashboard
│   ├── products.ejs          # Products list
│   ├── product.ejs           # Product details
│   ├── license.ejs           # License details
│   ├── create_*.ejs          # Creation forms
│   └── partials/             # Shared components
├── Dockerfile                # Container configuration
├── docker-compose.yml        # Multi-container setup
└── package.json              # Dependencies

```

## Scripts

| Script | Purpose |
|--------|---------|
| `npm run dev` | Start dev server with auto-reload and CSS watch |
| `npm run watch:server` | Run Node server with Nodemon |
| `npm run watch:css` | Watch and rebuild Tailwind CSS |
| `npm run build` | Build CSS for production |
| `npm start` | Run production server |

## License

MIT

## Author

Created by [The Maximalist](https://twitter.com/themaximal1st), updated for XRComm GRPC license management.

See our [open-source projects](https://themaximalist.com/products).

## Support

For issues with Keygen integration, see [Keygen.sh documentation](https://keygen.sh/docs).

For this dashboard, open an issue on [GitHub](https://github.com/themaximalist/keygen-admin/issues).


