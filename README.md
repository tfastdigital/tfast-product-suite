# Tfast Product Suite

Planning, specifications and business notes for the software products Tfast Digital Agency builds and sells in Uganda.

## What this repository is

Tfast Digital Agency ([tfastdigital.com](https://tfastdigital.com)) makes its living from services: websites, systems, support, training. Project work is good but it does not scale. So we are packaging the software we install most often into a small product line.

Every product is built on a proven open-source foundation, then branded, localized and supported by us. This repository holds the full product plans — features, roles, architecture, languages, hosting, versions, mobile app decisions and timeframes. Each product has its own detailed specification in the `docs` folder.

## Why we build on open-source foundations

Three reasons, in order of importance:

1. **We are not a product lab.** Rewriting a core banking engine or a school system from zero would take years we do not have. The open-source world already solved the hard 80%. Our value is the last mile: mobile money, EFRIS, NSSF, UNEB formats, training in plain language, and being reachable by phone when something breaks.
2. **It is cheaper for the customer.** A SACCO that would pay UGX 20M+ for a proprietary system gets the same class of software from us for a fraction, because the core is free. We sell the setup and the ongoing care.
3. **It keeps us honest with GitHub rules.** We fork properly, keep every license file intact, credit upstream projects on our credits pages, and push useful fixes back. That builds trust with clients and with developers.

## The lineup

| # | Product | Planned repo | Built on | License | Mobile app | MVP time | Phase |
|---|---|---|---|---|---|---|---|
| 1 | Tfast SACCO | `tfast-sacco` | Apache Fineract + Mifos X | Apache-2.0 / MPL-2.0 | Yes (member + field officer) | 12–16 wks | 1 |
| 2 | Tfast POS | `tfast-pos` | OSPOS | MIT + footer rule | Tablet web, app later | 6–8 wks | 1 |
| 3 | Tfast Flashing Suite | `tfast-flashing-suite` | mtkclient + scrcpy | MIT / Apache-2.0 | No (desktop tool) | 3–4 wks | 1 |
| 4 | Tfast School | `tfast-school` | Gibbon | GPL-3.0 | Yes (parent app) | 10–12 wks | 2 |
| 5 | Tfast Store | `tfast-store` | Medusa | MIT | PWA now, apps later | 10–12 wks | 2 |
| 6 | Tfast Cyber | `tfast-cyber` | Wazuh + GoPhish | GPL-2.0 / MIT | No (web dashboards) | 6–8 wks | 2 |
| 7 | Tfast Clinic | `tfast-clinic` | OpenMRS | MPL-2.0 | Not initially | 12–16 wks | 3 |
| 8 | Tfast Church | `tfast-church` | ChurchCRM | MIT | Yes, phase 2 | 8–10 wks | 3 |
| 9 | Tfast HR | `tfast-hr` | Krayin | MIT | Yes, phase 2 | 8–10 wks | 3 |
| 10 | Tfast Site Builder | `tfast-site-builder` | GrapesJS | BSD-3 | No (web only) | 8–10 wks | 3 |

## Build order and the thinking behind it

**Phase 1 — quick wins plus the flagship.**
The Flashing Suite is ready in a month and repair shops pay cash. The POS answers a real regulatory pain (URA EFRIS) for shops that have no alternative. Tfast SACCO is the flagship: the biggest deal sizes, a proven market, and a foundation (Fineract) that is already world-class. Landing these three gives us revenue and reference customers before we spend on the rest.

**Phase 2 — steady sellers.** School, Store and Cyber all have clear buyers and moderate build effort. They reuse the mobile money integration built for the SACCO.

**Phase 3 — niche but reliable.** Clinic, Church, HR and Site Builder are smaller markets but loyal ones. They come last because they compete with more local vendors and need more sales effort per deal.

## The business model

Our customers in Uganda do not buy software the way people in Europe do. They buy outcomes and someone to call when it breaks. So we sell:

- **Setup fee** — installation, data migration, branding, first training. One-time, UGX 1.5M to 12M depending on the product.
- **Monthly support contract** — updates, backups, helpdesk. UGX 150k to 1.5M per month. This is the real business; it compounds.
- **Cloud hosting** — we run it on our infrastructure, customer pays a flat monthly fee. Includes backups and monitoring.
- **Hardware bundles** — mini-PC, barcode scanner, receipt printer, UPS. Marked up 30–40%. Popular because customers want one invoice and one person responsible.
- **Training** — paid workshops, on-site or at our office.
- **Custom work on top** — integrations, extra modules, branded mobile apps. Priced per project, never more than 30% of our total revenue target.

The rule we hold ourselves to: never sell the open-source code as if we wrote it. We sell the deployment, the localization, the training and the guarantee. That keeps us on the right side of every license we use, and it is also simply the truth.

## Team needed

- 2 backend developers (PHP and Java/Node experience)
- 1 Flutter developer (mobile apps)
- 1 frontend/designer
- 1 part-time project manager and support person

Phase 1 is achievable with 3 people if the PM role is shared. We hire the second backend developer when the SACCO build starts.

## Risks we accept and how we handle them

- **Support load.** Every customer contract includes a support SLA. We cap support hours per month per customer and sell extra hours.
- **Internet and power.** Products that must work during outages (POS, Clinic) are deployed on-prem with offline-first design. Cloud products get SMS fallback for critical alerts.
- **License discipline.** One person on the team owns the compliance checklist: license files kept, NOTICE files added, upstream credited, forks kept proper. Audited before every release.
- **Scope creep.** Every version is scoped in the spec. Anything outside the version goes to the paid custom list.

## Repository conventions

Every product repository follows the same shape so clients and contributors know what to expect:

- README: what it is, who it is for, features, quick start, credits, license.
- `LICENSE` and `NOTICE` files kept from upstream, plus our own additions clearly marked.
- `docs/` folder with installation, user guide and admin guide.
- GitHub description starts with the product name and audience, e.g. "SACCO and microfinance management for Ugandan cooperatives — built on Apache Fineract."
- GitHub topics per product are listed in each specification.

## Documents

- [01 — Tfast SACCO](docs/01-tfast-sacco.md)
- [02 — Tfast POS](docs/02-tfast-pos.md)
- [03 — Tfast Flashing Suite](docs/03-tfast-flashing-suite.md)
- [04 — Tfast School](docs/04-tfast-school.md)
- [05 — Tfast Store](docs/05-tfast-store.md)
- [06 — Tfast Cyber](docs/06-tfast-cyber.md)
- [07 — Tfast Clinic](docs/07-tfast-clinic.md)
- [08 — Tfast Church](docs/08-tfast-church.md)
- [09 — Tfast HR](docs/09-tfast-hr.md)
- [10 — Tfast Site Builder](docs/10-tfast-site-builder.md)

## License

The documents in this repository are the property of Tfast Digital Agency, © 2026. The software products they describe are built on the open-source projects named in each document, under their respective licenses.
