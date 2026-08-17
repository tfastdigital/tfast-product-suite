# Tfast HR — payroll and HR for Ugandan SMEs

**Status:** Proposed — awaiting build approval
**Built on:** Krayin (MIT)
**Planned repo:** `tfastdigital/tfast-hr`
**GitHub tags:** `hr`, `payroll`, `nssf`, `paye`, `uganda`, `employee-management`, `open-source`

## The business case

Any Ugandan company with more than about ten staff has a payroll problem: PAYE tables, NSSF at 15% (5% employee, 10% employer), leave days, and staff who want their payslip without asking the accountant. The alternatives are either expensive foreign SaaS that does not know NSSF exists, or an Excel file that one person guards with their life.

Krayin is a clean, MIT-licensed HR and payroll system built on Laravel. We add the Ugandan computation layer — PAYE, NSSF, LST (Local Service Tax) where applicable — and the employee self-service experience. This product sells itself to accountants: show them a correct payslip with NSSF computed in one click and the deal is half done.

## Who buys it

- SMEs with 10–200 staff
- NGOs and development organisations with donor payroll reporting
- Schools with many staff (cross-sells with Tfast School)
- SACCOs managing their own staff (cross-sells with Tfast SACCO)

## How we make money

- One-time setup fee, including employee data import
- Monthly support contract
- Monthly hosting fee
- Yearly tax-table updates included in support; custom reports quoted separately

## Features in detail

### Admin (HR)

- Employee records: contracts, departments, positions, documents
- Leave management: annual, sick, maternity — with accrual rules
- Attendance and timesheets (manual or file import)
- Payroll runs: monthly, with per-employee review before commit
- PAYE computation per URA tables, NSSF split, LST where applicable
- Payslips by email and SMS
- Reports: payroll summary, NSSF schedule, PAYE schedule for URA returns
- Audit log of every payroll change

### Employee self-service

- View payslips, download PDF
- Apply for leave, see balance
- Update own profile details

### Roles and permissions

| Role | What they can do |
|---|---|
| Admin | Everything, including payroll commits and tax settings |
| Payroll officer | Runs payroll, edits within limits; no employee profile edits |
| HR officer | Employee records, leave approvals |
| Manager | Approve leave for own team, view team attendance |
| Employee | Own payslip, own leave, own profile |

## Architecture

Laravel application with MySQL. The tax computation is a versioned module — tax tables change every July, so we update one file and push it to every customer at once. That is the quiet superpower of SaaS-style delivery.

- **Core:** Krayin (Laravel, PHP) with MySQL
- **Tax engine:** our module — PAYE tables, NSSF rates, LST — with year-stamped versions
- **Delivery:** Docker on our cloud, multi-tenant by customer subdomain
- **SMS/email:** payslip delivery through the shared gateway

## Languages and stack

- PHP (Laravel) — Krayin's stack, and Laravel developers are easy to hire in Kampala
- MySQL — payroll data is relational by nature
- Docker + Nginx — standard deployment
- Flutter later for the employee app

## Hosting

Cloud-first. Payroll data is sensitive, so every tenant gets database encryption, backups and an access log. Large clients can request on-prem; we charge more for it.

## Mobile app

Phase 2: an employee app in Flutter — payslips, leave requests, notifications. The web portal is responsive enough for v1.

## Versions

- **v1.0:** employee records, leave, payroll with PAYE/NSSF, payslips, self-service portal
- **v1.5:** biometric/attendance import, contractor payments, donor report pack
- **v2.0:** employee app, recruitment pipeline, performance reviews

## Timeframe

8–10 weeks with 2 developers. The tax module needs an accountant's review before release — budget a week for that and never skip it.

## License and rules

Krayin is MIT. Proper fork, license preserved, upstream credited. Our tax engine module is our own MIT code — and it is the kind of module worth contributing back once it is proven, because it earns goodwill and free review from the community.
