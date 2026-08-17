# Tfast Clinic — clinic and hospital records

**Status:** Proposed — awaiting build approval
**Built on:** OpenMRS (MPL-2.0) — primary choice. HospitalRun (MIT) noted as reference but archived since 2023.
**Planned repo:** `tfastdigital/tfast-clinic`
**GitHub tags:** `healthcare`, `emr`, `clinic-management`, `uganda`, `patient-records`, `hmis`, `open-source`

## The business case

Private clinics are everywhere in Uganda, and most still run on exercise books. The Ministry of Health expects reporting (HMIS), patients lose paper files, and drug stock walks out the door uncounted. A clinic system pays for itself in the first year through three things alone: fewer lost patient records, honest drug stock, and reports that take hours instead of weeks.

OpenMRS is the most widely used open-source medical record system in the world and it was literally built for low-resource settings. It is a real platform, not a toy, which means the build takes longer than the lighter products — but it opens the door to government and NGO contracts that a spreadsheet-turned-app never would.

## Who buys it

- Private clinics with 1–5 doctors
- Maternity homes
- NGO health centres and community clinics
- Pharmacies attached to clinics (stock module)

## How we make money

- One-time setup fee, including patient record migration
- Monthly support contract
- Hosting or on-prem installation, billed monthly
- Training, includes nurses and reception staff
- Custom forms and HMIS report packs as paid work

## Features in detail

### Admin

- Patient registration: demographics, next of kin, insurance/scheme details
- Appointments and queue management
- User accounts and role assignment
- Drug inventory: stock in, stock out, expiry alerts, reorder levels
- Billing: consultation fees, procedure fees, receipts
- HMIS monthly report export
- Audit log of every record access

### Clinical staff

- Consultation notes with templates (SOAP-style) per specialty
- Vitals capture: temperature, BP, weight — graphed over time
- Prescriptions with drug interaction warnings and stock check
- Lab orders and results attached to the patient file
- Referral letters printed on clinic letterhead

### Reception

- Registration and queue numbers
- Billing and receipts
- Appointment scheduling with SMS reminders

### Roles and permissions

| Role | What they can do |
|---|---|
| Admin | Everything, including staff accounts and drug stock |
| Doctor | Full clinical records for their patients |
| Nurse | Vitals, observations, medication administration |
| Pharmacist | Dispensing and drug stock only |
| Lab technician | Lab orders and results |
| Receptionist | Registration, appointments, billing |
| Auditor | Read-only access to everything |

## Architecture

OpenMRS 3 gives us a modern React frontend on the battle-tested Java backend. The clinic runs it on a mini-PC on the local network — internet outages must never stop a consultation. A nightly encrypted backup syncs to our cloud.

- **Core:** OpenMRS (Java) with MySQL/MariaDB
- **Frontend:** OpenMRS 3 (React)
- **Forms:** local form templates for consultations, antenatal, immunisation
- **Deployment:** Docker on a mini-PC; cloud sync agent for backups
- **SMS:** appointment reminders through the shared gateway

## Languages and stack

- Java — the core platform's language; we operate it, we do not rewrite it
- React — frontend customization (OpenMRS 3)
- MySQL/MariaDB — patient data
- Docker — identical image for on-prem and cloud
- Flutter later for the patient app

We chose OpenMRS over the simpler HospitalRun because HospitalRun was archived in 2023 — betting a product on an abandoned codebase is how agencies die. OpenMRS is active, has a large community, and its MPL-2.0 license lets us run a commercial service around it.

## Hosting

On-prem mini-PC for the clinic itself — this is non-negotiable for us: consultations cannot depend on the internet. Our cloud stores backups and hosts the patient portal if the clinic wants one. Larger hospitals can get a proper on-prem server.

## Mobile app

Not initially — reception and clinical staff work on tablets at desks, which the web frontend already covers. Phase 2: a patient app (appointments, own records, lab results). Phase 3: community health worker app for outreach visits, offline-first.

## Versions

- **v1.0:** patient records, consultations, prescriptions, drug stock, billing, HMIS export
- **v1.5:** lab module deep-dive, antenatal and immunisation packs, SMS reminders
- **v2.0:** patient app, telemedicine-lite (video consults), outreach worker app

## Timeframe

12–16 weeks with 3 developers. This is the heaviest build in the line-up because health data is unforgiving — the extra weeks are testing and form design, not marketing.

## License and rules

OpenMRS is MPL-2.0 (file-level copyleft). Our form packs, branding and integrations are our own code and can stay closed or be MIT — we keep the MPL headers on every OpenMRS file we touch and credit the project in-app and in the README. Contributions upstream are welcome and strategically smart: the OpenMRS community notices vendors who give back.
