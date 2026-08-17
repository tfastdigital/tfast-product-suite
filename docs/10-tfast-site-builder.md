# Tfast Site Builder — websites for small businesses

**Status:** Proposed — awaiting build approval
**Built on:** GrapesJS (BSD-3-Clause)
**Repository:** [tfast-site-builder](https://github.com/tfastdigital/tfast-site-builder)
**GitHub tags:** `website-builder`, `no-code`, `grapesjs`, `uganda`, `small-business`, `open-source`

## The business case

Every restaurant, school, church, clinic and shop in Uganda eventually gets told "you need a website". Agencies charge serious money for a custom site, and most small businesses cannot justify it. The answer is a template-driven builder: they pick a template, swap the text and photos, add a MoMo pay button or WhatsApp chat, and go live the same week — for a monthly fee instead of a big upfront bill.

GrapesJS is the open-source drag-and-drop builder framework (BSD-3). We build the product around it: Ugandan template packs, hosting, domains, and a client billing portal. This product also feeds the rest of the line-up — every Tfast product gets its landing page built on it, and our agency design work gets faster.

## Who buys it

- Restaurants, salons, boutiques, clinics, churches, schools
- Professionals: lawyers, accountants, consultants
- NGOs with small project sites
- Any business that currently only exists on Facebook

## How we make money

- Monthly subscription (template tier vs. custom tier)
- One-time setup fee (content entry, logo placement)
- Domain and hosting bundled; SSL always included
- Custom template design as a premium service
- WhatsApp/MoMo integrations included in the higher tier

## Features in detail

### Admin (agency)

- Client accounts, subscriptions and billing
- Template library management
- Domain and DNS management
- Global updates: push a fix to all sites at once
- Uptime monitoring and analytics per site
- Roles and permissions for our staff

### Client (site owner)

- Drag-and-drop editor: text, images, galleries, contact forms, maps
- Ugandan template pack: restaurant menu, school, church, clinic, shop, salon, professional CV-site
- MoMo pay button and WhatsApp chat button built in
- Blog/news section with simple posts
- Connect own domain or use a free subdomain
- Basic visitor analytics

### Roles and permissions

| Role | What they can do |
|---|---|
| Agency admin | Everything: accounts, templates, billing, domains |
| Designer | Create and edit templates; edit any client site |
| Support | View and fix client sites, no billing access |
| Client editor | Own site content only; cannot change plan or domain |
| Client owner | Own site content plus plan, domain and billing |

## Architecture

The builder is a React app around the GrapesJS core. Sites are exported as static HTML and served from our hosting with a CDN — fast, cheap and hard to break. No WordPress-style plugin hell; that is a selling point, not a limitation, for the clients we target.

- **Builder:** React + GrapesJS (BSD-3)
- **Backend:** Node.js, PostgreSQL for accounts/templates/billing
- **Serving:** static export + CDN; forms and payments via small API endpoints
- **Integrations:** MoMo pay links, WhatsApp, Google Maps

## Languages and stack

- TypeScript/React — the builder UI
- Node.js — accounts, billing, publishing pipeline
- PostgreSQL — accounts and template metadata
- Static HTML output — what the customer's visitors actually load

## Hosting

Our cloud, multi-tenant. Every site gets SSL, CDN, nightly backups and an uptime check. A site is static, so the whole catalogue fits on modest infrastructure — this product has the best margin-to-cost ratio in the line-up.

## Mobile app

No — websites must simply be responsive, and the editor works in a mobile browser. Nothing to build here, which is part of why this product is cheap to run.

## Versions

- **v1.0:** builder, 6 template packs, subscriptions, domains, MoMo/WhatsApp buttons
- **v1.5:** client billing portal polish, custom fonts, bookings widget
- **v2.0:** e-commerce blocks (reusing Tfast Store), multi-language pages

## Timeframe

8–10 weeks with 2 developers. GrapesJS does the heavy lifting; the work is templates, billing and polish.

## License and rules

GrapesJS is BSD-3-Clause — commercial use is fully allowed with attribution in the license file. Our product code is our own. The repo is a proper fork where it forks upstream, credits are visible in the About screen, and the BSD notice travels with every copy of the builder code we ship.
