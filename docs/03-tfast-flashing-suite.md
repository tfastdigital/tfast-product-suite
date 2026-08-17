# Tfast Flashing Suite — phone repair toolkit for workshops

**Status:** Proposed — awaiting build approval
**Built on:** mtkclient (MIT) + scrcpy (Apache-2.0) + driver packs and our own documentation
**Planned repo:** `tfastdigital/tfast-flashing-suite`
**GitHub tags:** `phone-repair`, `mtk`, `flashing-tool`, `android`, `uganda`, `mobile-repair`, `windows-tool`, `open-source`

## The business case

Every market street in Uganda has a phone repair shop, and the busiest job in those shops is software: flashing firmware, removing screen locks, resetting FRP on a phone the customer owns, unbricking dead devices. Shops currently pay hundreds of dollars for dongle-based box tools with yearly licenses, or they send the phone "downtown" and split the fee.

The open-source tooling (mtkclient above all) now does most of what those boxes do on MediaTek phones — and MediaTek phones are the majority in Uganda. Our play: package the tools into one clean Windows installer with drivers, a friendly launcher, step-by-step guides and local training. The software is free; the workshop pays for training, the pro launcher and support. We position ourselves squarely on legitimate repair work: unbricking, firmware flashing, data backup, and FRP reset for the device owner.

We do not advertise or support IMEI tampering — it is illegal in most jurisdictions and it would poison the brand. Repair shops understand the difference; the honest ones are happy to have a supplier who stays inside the law.

## Who buys it

- Phone repair shops and technicians in Kampala and upcountry towns
- Importers and refurbishers who flash and reset used phones in bulk
- Mobile money agents and gadget shops that offer repair as a side service

## How we make money

- Free installer with the open tools — builds the brand
- Paid training: UGX 150k–300k per technician, half-day workshop
- Pro launcher license: UGX 50k–100k per workshop per year (batch jobs, job logs, customer receipt printing)
- Support WhatsApp group: free, with paid priority support
- Repair-shop starter kit: cables, screwdrivers, ESD mat, USB hubs — bundled with training

## Features in detail

### Free edition

- One installer for Windows: mtkclient, ADB/fastboot, USB drivers, scrcpy — everything pre-configured
- Launcher menu with plain options: Flash firmware, Remove screen lock (owner only), Reset FRP, Full backup, Restore backup, Mirror phone screen
- Firmware links and checksums for common Tecno, Infinix, itel and Samsung models sold in Uganda
- Step-by-step guides in English with screenshots; video walkthroughs on our channel
- Offline operation — nothing phones home

### Pro edition (workshop license)

- Job queue: line up several phones, the suite processes one after another
- Job log with customer name, device, IMEI of record (for warranty claims, not tampering)
- Printed job receipts for customers
- Team accounts: owner, senior tech, junior tech

### Roles (pro edition)

| Role | What they can do |
|---|---|
| Owner | Licenses, pricing, all job logs, reports |
| Senior tech | All tool functions, can override safety prompts |
| Junior tech | Flashing and backup only; lock removal requires senior approval |

## Architecture

A Python core (mtkclient) wrapped in a simple desktop launcher. The launcher is a thin shell — it writes config, runs the tools, and shows human-friendly progress. Everything runs locally on the workshop PC; the pro edition checks its license once a month and works offline in between.

- **Core:** mtkclient (Python), ADB/fastboot, scrcpy
- **Launcher:** Python with a simple desktop UI
- **Installer:** standard Windows installer bundling drivers
- **Docs:** markdown guides in the repo + printable PDF cheatsheets

## Languages and stack

- Python — the core tools are Python, and it keeps the whole thing scriptable
- Desktop UI in Python (Tkinter or a thin web view) — no need for a heavier framework for a launcher
- Inno Setup for the Windows installer
- PowerShell scripts for driver checks

## Hosting

None — it is a desktop tool. Updates ship through the installer and a simple update check. Firmware files live on cloud storage with checksums; the suite works fully offline apart from downloading firmware.

## Mobile app

No app for the suite itself. Later, an Android companion app for shop owners to see job counts and license status. The phones being repaired connect by USB — that is the whole point.

## Versions

- **v1.0:** installer with tools, drivers, launcher menu, guides for 5 common device families
- **v1.5:** pro edition with job queue, logs and receipts; more device guides
- **v2.0:** auto-detection of device model, guided unbrick flows, owner app

## Timeframe

3–4 weeks with 1 developer plus a technician to write the guides. This is deliberately our first product to ship — it is packaging and documentation more than engineering.

## License and rules

mtkclient is MIT, scrcpy is Apache-2.0. Both stay in the installer with their license files visible in an About screen. Our launcher and docs are our own, MIT-licensed. The repo is a proper fork structure with upstreams credited, and the README carries a clear legal disclaimer: the suite is for legitimate repair of devices you own or are authorized to service.
