# Tfast Cyber — security monitoring and awareness for Ugandan businesses

**Status:** Proposed — awaiting build approval
**Built on:** Wazuh (GPL-2.0) + GoPhish (MIT) + our own playbooks and reports
**Planned repo:** `tfastdigital/tfast-cyber`
**GitHub tags:** `cybersecurity`, `siem`, `wazuh`, `security-awareness`, `uganda`, `compliance`, `open-source`

## The business case

Uganda's Data Protection Act (2019) is being enforced more seriously, and banks, MFIs, NGOs and larger companies are waking up to two needs at once: prove they monitor their systems, and train their staff not to click the phishing link. Both needs are service-shaped — monitoring, alerts, reports, training campaigns — which is exactly what a services agency should sell.

Wazuh is a full SIEM/XDR platform (log collection, threat detection, file-integrity monitoring, compliance mapping) and it is free under GPL-2.0. GoPhish runs safe phishing simulations so companies can measure how clickable their staff are. Neither is a product our clients will run themselves — that is our margin: we deploy, tune, monitor and report.

## Who buys it

- Banks, MFIs and SACCOs under regulatory pressure
- NGOs and development agencies with donor compliance requirements
- Universities and large schools
- Growing SMEs with an office network and a fear of ransomware

## How we make money

- Setup: vulnerability review + deployment, UGX 2M–6M depending on endpoints
- Monitoring-as-a-service: UGX 300k–1.5M per month by endpoint count
- Awareness campaigns: quarterly phishing simulations with a staff report, UGX 500k–1.5M per campaign
- Incident response retainer: annual contract, priority line
- Compliance report pack: annual, for auditors

## Features in detail

### Admin (our analysts)

- SIEM dashboards: alerts, asset inventory, agent health
- File-integrity monitoring across client machines
- Log collection from Windows, Linux, network devices
- Alert rules tuned per client (a pharmacy does not need bank-level noise)
- Monthly client reports: what happened, what we did, what to watch
- Compliance mapping against the Data Protection Act and ISO 27001 controls

### Client view

- Read-only portal: their alerts, their report history, their training stats
- Awareness campaign results: who clicked, who reported it correctly
- Downloadable evidence for auditors

### Roles and permissions

| Role | What they can do |
|---|---|
| Tfast admin | Full platform: rules, agents, reports |
| Tfast analyst | Investigate alerts, run reports; no rule changes |
| Client security lead | View alerts and reports for their org |
| Client staff | Only their own training results |

## Architecture

Wazuh manager on our cloud, lightweight agents on every client machine (laptop, server, even the office router logs). Kibana/Elastic provides the dashboards. GoPhish runs as a separate service per campaign. All multi-tenant, so ten clients share infrastructure without seeing each other's data.

- **Detection:** Wazuh manager + agents (GPL-2.0)
- **Dashboards:** Elastic + Kibana
- **Awareness:** GoPhish (MIT)
- **Deployment:** Docker, isolated tenant namespaces
- **Reporting:** our own report generator (markdown → PDF)

## Languages and stack

- Infrastructure and glue in Python — agent rollout, report generation, tenant automation
- Wazuh is C/Python, Elastic is Java — we operate them, we do not modify them
- Web portal: small Next.js app for the client view

## Hosting

Our cloud, always. Agents phone home from client sites. For very sensitive clients (banks) we offer an on-prem Wazuh deployment they host, with us retaining monitoring access.

## Mobile app

No app — clients get SMS and email alerts, and the client portal works fine on a phone browser.

## Versions

- **v1.0:** Wazuh deployment, agent rollout, monthly reports, one awareness campaign template
- **v1.5:** vulnerability scanning add-on, compliance report pack for the Data Protection Act
- **v2.0:** 24/7 watch rotation, incident response playbooks productized

## Timeframe

6–8 weeks with 2 developers — this is mostly infrastructure and playbooks, not new code. The first paying client can be onboarded by week 6.

## License and rules

Wazuh is GPL-2.0, GoPhish is MIT. We do not modify either core; we run them and build our portal and playbooks around them. Both remain credited on our portal and in client documentation, with license files available in the repo. Selling monitoring as a service around GPL software is fully allowed — the GPL governs the software, not the service.
