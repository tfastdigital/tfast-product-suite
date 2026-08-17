# Tfast POS — retail point of sale

**Status:** Proposed — awaiting build approval
**Built on:** OSPOS (MIT, with a required footer signature)
**Repository:** [tfast-pos](https://github.com/tfastdigital/tfast-pos)
**GitHub tags:** `point-of-sale`, `retail`, `efris`, `uganda`, `inventory`, `barcode`, `offline-first`, `open-source`

## The business case

Every shop, pharmacy, hardware store and supermarket in Uganda eventually outgrows the paper book. The government is pushing VAT-registered businesses onto EFRIS e-invoicing, and most shop owners find EFRIS painful. A POS that quietly handles EFRIS for them, prints receipts, tracks stock and survives a power cut is an easy sell.

We do not compete with the fancy cloud POS systems. We sell to the shop that wants one box on the counter, no monthly drama, and someone to call in Luganda or English when the printer stops.

## Who buys it

- Pharmacies and drug shops
- Hardware stores and building materials
- Supermarkets and mini-marts
- Boutiques and electronics shops
- Any VAT-registered retailer who must issue EFRIS invoices

## How we make money

- Hardware + software bundle: mini-PC, barcode scanner, receipt printer, UPS — sold as one unit
- One-time setup fee, including stock data entry
- Monthly support contract
- EFRIS setup and training as a paid line item

## Features in detail

### Admin

- Products, categories, barcodes, supplier list, cost and selling prices
- Stock management: purchases, returns, stock alerts at minimum levels
- Price lists and discounts (per product, per customer group)
- Reports: daily sales, profit per item, VAT collected, stock valuation
- EFRIS configuration and submission status view
- User accounts, tills and shift management
- Receipt design (name, address, TIN on every receipt)

### Cashier

- Barcode sales and quick search sales
- Returns and exchanges with receipts
- Credit sales with a customer ledger
- Shift open and close with cash count
- Works fully when the internet is down; syncs when it returns

### Roles and permissions

| Role | What they can do |
|---|---|
| Owner/admin | Everything, including prices, users and EFRIS settings |
| Manager | Stock, reports, discounts; no price changes below cost |
| Cashier | Sales, returns, shift open/close; nothing else |
| Stock controller | Purchases, receiving, stock counts |

## Architecture

A single PHP application with MariaDB, running in Docker on the shop's mini-PC. The browser is the cashier screen — any tablet or second-hand monitor works. A small sync agent pushes daily sales to our cloud for backup and multi-outlet reporting later.

- **Core:** OSPOS (PHP, CodeIgniter) with MariaDB
- **Our modules:** EFRIS invoice submission, MoMo payment capture, SMS receipts, sync agent
- **Hardware:** barcode scanner, 80mm thermal printer, UPS

The OSPOS license requires their footer signature to stay visible on every page. That is fine — it is one line of text, and respecting it costs us nothing and keeps the project maintainers happy. Our branding lives in the theme, the login screen, the receipts and the training materials.

## Languages and stack

- PHP (CodeIgniter) — the core; cheap to host, easy to find developers for
- MariaDB — transactions are simple and local, no need for anything fancier
- Docker — one-command install on the mini-PC
- Custom EFRIS module in PHP talking to URA's API

## Hosting

On-prem first. The mini-PC runs the whole thing on the local network, so a dead internet connection never stops sales. Our cloud holds encrypted nightly backups and the multi-outlet dashboard. Cloud-only deployment is offered to shops that want it, but we recommend against it for single-location customers.

## Mobile app

No native app needed to start — the web app already works on any Android tablet. Two additions later:

- Stock-taking app (Flutter) for scanning shelves during counts
- Owner app for sales figures and alerts on their phone

## Versions

- **v1.0:** base POS + EFRIS submission + receipt branding + hardware image
- **v1.5:** multi-outlet sync, customer credit ledger, supplier purchase orders
- **v2.0:** stock-taking app, owner analytics app, loyalty points

## Timeframe

6–8 weeks with 2 developers. The base system is ready; the work is the EFRIS module, the theme, the hardware image and the training pack.

## License and rules

OSPOS is MIT with one extra condition: their footer signature must remain visible on every page. We keep it, unmodified. Our EFRIS and MoMo modules are our own code, licensed MIT, and the repo fork stays proper with the original license file intact and upstream credited.
