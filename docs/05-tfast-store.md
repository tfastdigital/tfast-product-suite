# Tfast Store — e-commerce for Ugandan shops

**Status:** Proposed — awaiting build approval
**Built on:** Medusa (MIT)
**Planned repo:** `tfastdigital/tfast-store`
**GitHub tags:** `ecommerce`, `medusa`, `mobile-money`, `mtn-momo`, `airtel-money`, `uganda`, `headless-commerce`, `open-source`

## The business case

Ugandans buy online already — through WhatsApp, Instagram and TikTok DMs, with payment by MoMo and delivery by boda. What most small shops do not have is a proper storefront that takes orders while they sleep and handles the payments and delivery tracking without manual bookkeeping.

Medusa is a modern, modular commerce engine. The core is MIT-licensed and solid; the work for Uganda is the payment layer (MTN MoMo, Airtel Money, bank cards later), SMS order updates and a storefront that loads fast on cheap Android phones. We sell this as a complete package: store, payments, training, hosting.

## Who buys it

- Fashion boutiques and electronics shops selling via social media
- Supermarkets and minimarts going online
- Pharmacies selling health products
- Small manufacturers selling direct (juice, soap, crafts)
- Multi-vendor markets as a phase-2 offering

## How we make money

- One-time setup fee, including product upload
- Monthly hosting fee
- Monthly support contract
- Transaction success fee: optional model — we start with flat monthly fees, transactions come later
- Delivery rider app and multi-vendor marketplace as paid upgrades

## Features in detail

### Admin (shop owner)

- Products, categories, stock levels, pricing
- Orders from all channels in one queue
- Discounts, vouchers and flash sales
- Customer list with order history
- Staff accounts with roles
- Sales reports: revenue, top products, payment method split
- Payment reconciliation against MoMo statements

### Staff

- Fulfilment staff: pick, pack, mark shipped, hand to rider
- Support staff: answer order questions, process refunds
- Cashier mode for walk-in customers

### Customer (storefront)

- Fast, mobile-first catalog that works on a weak connection
- Cart and checkout in 3 steps
- Pay with MTN MoMo, Airtel Money or pay on delivery
- SMS updates at each stage: ordered → packed → out for delivery → delivered
- Order history and re-order in one tap

### Roles and permissions

| Role | What they can do |
|---|---|
| Owner | Everything, including staff accounts and payout settings |
| Manager | Products, discounts, reports; no staff account changes |
| Fulfilment | Orders and shipping statuses only |
| Support | View orders, process refunds within limits |
| Customer | Own orders and profile |

## Architecture

Medusa is headless: the admin panel and storefront are separate apps talking to one Node.js backend. That suits us — we keep the engine clean and put all the Ugandan logic in plugins.

- **Engine:** Medusa (Node.js/TypeScript) with PostgreSQL and Redis
- **Storefront:** Next.js, static-rendered for speed, PWA-enabled
- **Admin:** Medusa admin, restyled with Tfast branding
- **Payments:** our MoMo/Airtel plugin (shared with SACCO and School work)
- **SMS:** order-status service through a local SMS gateway

## Languages and stack

- TypeScript/Node.js — Medusa is TypeScript end to end, and it is a well-documented, modern stack
- Next.js — storefront with good performance on cheap devices
- PostgreSQL — transactions need a real database
- Flutter later for the rider app (reuses the SACCO mobile skills)

## Hosting

Cloud VPS with Docker. Two tiers: shared hosting for small shops (cheaper, one server per several stores) and dedicated for bigger customers. Storefront is static-rendered so even a modest VPS handles spikes. CDN in front for images.

## Mobile app

Storefront ships as a PWA — installable from the browser, no app store hassle, and it works like a native app on Android. Later: a Flutter shopper app for brand-forward stores, and a rider app (order pickup, route, proof of delivery photo) as a paid module.

## Versions

- **v1.0:** storefront + admin + MoMo/Airtel payments + SMS updates
- **v1.5:** multi-vendor marketplace, vouchers, WhatsApp order link
- **v2.0:** rider app, loyalty points, pay-by-link for social sellers

## Timeframe

10–12 weeks with 2–3 developers (1 backend, 1 frontend, shared payments developer). The payment plugin is reused from earlier products, which is the point of the shared middleware.

## License and rules

Medusa core is MIT (with an Enterprise Edition that we do not touch). We fork properly, keep the MIT license and copyright notices, and list Medusa on our credits page. Our plugins are our own MIT code. No AGPL anywhere in this stack.
