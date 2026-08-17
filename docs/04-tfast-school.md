# Tfast School — school management platform

**Status:** Proposed — awaiting build approval
**Built on:** Gibbon (GPL-3.0)
**Planned repo:** `tfastdigital/tfast-school`
**GitHub tags:** `school-management`, `education`, `uganda`, `fees-management`, `attendance`, `parent-portal`, `mobile-money`, `open-source`

## The business case

Uganda has tens of thousands of private schools, and every one of them fights the same three battles: collecting fees, tracking attendance, and producing report cards and UNEB-ready records without spending weeks on Excel. Parents increasingly want to pay fees from their phone instead of queueing at the bursar's window.

Gibbon is a mature, actively developed school platform that already covers admissions, timetables, marks and reports. What it does not have out of the box is Ugandan reality: fees via MTN MoMo and Airtel Money, UNEB formatting, SMS to parents, and a parent app in simple English. That is our product.

## Who buys it

- Private primary and secondary schools with 300–2,000 students
- Nursery schools with fee-chasing problems
- International and city schools wanting a parent portal
- Chains of schools needing one dashboard for all campuses

## How we make money

- Setup fee: UGX 1.5M–4M including migration of student records
- Monthly support: UGX 250k–800k depending on school size
- Hosting: UGX 150k–400k per month
- Parent app branding as a paid add-on
- Termly training for new staff

## Features in detail

### Admin (school office)

- Admissions and student records with guardian details and photos
- Class structures, subjects, teachers and timetables
- Fee structures per class, invoicing, receipts, arrears reports
- Payments: cash, bank and MoMo — every payment tagged to a student
- Staff records: contracts, qualifications, payroll export
- UNEB candidate registration export, termly report templates
- Bulk SMS to parents and staff
- Permissions per staff member

### Teacher

- Take attendance in under a minute from phone or computer
- Enter marks per subject; report cards generate themselves
- Homework and notices to their classes
- Communication with parents through the portal

### Parent portal (mobile)

- See fees balance and pay instantly with MoMo or Airtel Money
- Child's attendance and report card
- School notices and event calendar
- Request a meeting with a teacher

### Roles and permissions

| Role | What they can do |
|---|---|
| Super admin | Everything, including fee structures and staff accounts |
| Bursar | Fees, payments, receipts, arrears; no academic data |
| Head teacher | Academic oversight, reports, staff management |
| Teacher | Own classes only: attendance, marks, notices |
| Parent | Own children only: fees, results, notices |
| Student | Own results and timetable, read-only |

## Architecture

Gibbon is a PHP/MySQL application, so deployment stays simple and cheap. Around it we build the payment and messaging glue and the parent app.

- **Core:** Gibbon (PHP) with MySQL/MariaDB
- **Payments:** Node.js service integrating MTN MoMo and Airtel Money APIs; every callback writes straight into the ledger
- **SMS:** gateway module with per-school balance management
- **Parent app:** Flutter, offline-readable (last synced results and balance)
- **Deployment:** Docker on a VPS, or on-prem for large schools

## Languages and stack

- PHP — the core platform's language; hosting is cheap and local developers are everywhere
- MySQL/MariaDB — reliable and boring, exactly what school data needs
- Node.js (payments middleware) — shared with the SACCO product, so the integration cost drops
- Flutter — parent app, same codebase for Android and iOS

## Hosting

Cloud VPS for most schools — parents must be able to pay from anywhere, so the portal needs to be reachable. On-prem offered only to big schools with a server room. All deployments include nightly encrypted backups to our storage.

## Mobile app

Yes. The parent app is the product's face — fees payment and results are the two things parents open. A teacher app (attendance and marks entry, works offline) follows in v1.5.

## Versions

- **v1.0:** core school system + fees with MoMo/Airtel + parent app + SMS
- **v1.5:** teacher offline app, UNEB report pack, exam analysis
- **v2.0:** timetable generator, library module, multi-campus dashboard

## Timeframe

10–12 weeks with 3 developers (1 PHP, 1 Node/payments, 1 Flutter). The MoMo integration is shared work with the SACCO build, which is why we schedule these in the same period.

## License and rules

Gibbon is GPL-3.0. That means our fork and our modules stay open source — we sell deployment, hosting, training and support, not licenses. We keep the GPL headers, credit Gibbon in the app footer and README, and contribute our fee-module improvements upstream where the maintainers want them.
