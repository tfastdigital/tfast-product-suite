# Tfast SACCO — SACCO and microfinance management

**Status:** Proposed — awaiting build approval
**Built on:** Apache Fineract (Apache-2.0) + Mifos X (MPL-2.0)
**Planned repo:** `tfastdigital/tfast-sacco`
**GitHub tags:** `sacco-management`, `microfinance`, `core-banking`, `uganda`, `fintech`, `mobile-money`, `apache-fineract`, `mifos-x`, `loan-management`, `open-source`

## The business case

Uganda runs on SACCOs. Thousands of cooperatives, staff savings schemes and village groups (VSLAs) hold people's savings and give out loans, and most of them still run on paper or a chaotic spreadsheet. A few local vendors sell this software — Saccowave, Mfuko Plus, SaccoSys — which tells us two things: the market is real, and the incumbents charge per module with thin support outside Kampala.

Apache Fineract is the same class of system used by 400+ institutions reaching 20 million customers. It is free, but installing and localizing it is real work — which is exactly what we sell. Our edge over the incumbents: mobile money built in from day one, UGX and UMRA reporting out of the box, and support that actually answers the phone.

## Who buys it

- SACCOs with 500 to 20,000 members — the bulk of the market
- Microfinance companies supervised by the Uganda Microfinance Regulatory Authority (UMRA)
- Church, school and company staff savings schemes
- NGO savings-group programmes looking for a proper ledger

## How we make money

- Setup fee: UGX 3M–8M depending on size and data migration work
- Monthly support contract: UGX 350k–1.5M
- Hosting fee: UGX 150k–500k per month on our cloud
- Training: UGX 500k per day, on-site or at our office
- Mobile apps and custom reports as paid add-ons

## Features in detail

### Admin (back office)

- Member registration: personal details, photo, ID number, groups and centers
- Savings products: shares, fixed deposits, voluntary savings, each with its own interest rules
- Loan products: declining balance or flat rate, grace periods, penalties, collateral tracking
- Disbursement and repayment processing, including group lending cycles (VSLA-style)
- Full accounting: chart of accounts, general ledger, journal entries
- Reports: portfolio at risk (PAR), loan aging, dividend computation, trial balance
- Complete audit trail — every change logged to the user who made it
- Bulk SMS and email to members
- UMRA-style regulatory exports for supervision reporting

### Staff (teller and loan officer)

- Daily cash and MoMo collections with receipt printing
- Loan workflow: application → committee approval → disbursement → repayment
- Field collections through the mobile app, works without internet
- Member statements printed or sent on demand

### Member self-service

- Balance, statement and loan status at any time
- Loan application from the phone
- Repayment via MTN MoMo or Airtel Money push
- Automatic reminders for due dates and missed payments

### Roles and permissions

| Role | What they can do |
|---|---|
| Super admin | Everything, including chart of accounts, product setup and audit review |
| Manager | Members, loans, approvals, all reports |
| Loan officer | Create loans up to a set limit, record repayments, view own portfolio only |
| Teller | Collections and deposits, receipts, no loan authority |
| Auditor | Read-only access to every record and report |
| Member | Own account only — balance, statement, loan application |

## Architecture

Fineract is a headless Java API. We put Mifos X in front of it as the staff web app, our own Flutter apps in front for members and field officers, and a small middleware service between everything and the mobile money and SMS providers.

- **Core:** Apache Fineract (Java/Spring) with MariaDB — the banking brain
- **Staff UI:** Mifos X web app (Angular)
- **Members/field:** Flutter mobile apps, offline-first
- **Middle layer:** Node.js service for MTN MoMo, Airtel Money and SMS gateway integrations
- **Deployment:** Docker Compose, so the identical stack runs on our cloud or on a client's mini-PC

We never modify accounting or loan math in the core. Our code lives in the middleware and the apps — that keeps upgrades painless and keeps our fork close to upstream.

## Languages and stack

- Java (Spring) — the core platform; heavy, but battle-tested for exactly this domain
- Angular — staff web app
- Node.js (NestJS) — payment and SMS middleware
- Flutter — both mobile apps from one codebase
- MariaDB, Docker, Nginx

The honest reason for this stack: we are not rewriting loan math. Fineract has been audited by real banks. We pick it because it is boring and correct, and we spend our energy on the parts customers actually notice — paying by phone, SMS alerts, reports in a language they understand.

## Hosting

Two options, same software:

- **Cloud (recommended):** Docker on a VPS. Works for 90% of SACCOs, we handle backups and updates, customer pays a flat monthly fee.
- **On-prem:** mini-PC in the SACCO office, offline LAN operation with scheduled sync to our cloud for backups. For rural SACCOs with unreliable internet.

## Mobile app

Yes. Two apps, one codebase (Flutter):

- **Member app:** balance, statement, loan application, MoMo repayment
- **Field officer app:** collections, new member registration, offline queue that syncs when connected

## Versions

- **v1.0 — MVP:** core banking, staff web app, member app basics, MoMo and Airtel collections, SMS reminders
- **v1.5:** USSD channel, group lending cycles, SMS campaigns, dividend runs
- **v2.0:** multi-branch support, deeper UMRA report pack, biometric check-in for tellers

## Timeframe

12–16 weeks with 3 developers (1 backend, 1 Flutter, 1 devops/tester). Data migration from Excel is quoted separately per client — it is usually the longest part of onboarding.

## License and rules

Fineract is Apache-2.0, Mifos X is MPL-2.0. We fork properly on GitHub, keep every license and notice file intact, brand the interfaces and README as Tfast, and keep an upstream credits page in the app. Useful fixes go back upstream as pull requests — it is the right thing to do and it keeps our fork cheap to maintain.
