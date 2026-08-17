# create-product-repos.ps1
# Creates one public GitHub repo per Tfast product from the spec documents.
# Run from the tfast-product-suite folder. Requires gh CLI logged in as tfastdigital.

$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent

$products = @(
  @{
    Name   = 'tfast-sacco'
    Doc    = 'docs/01-tfast-sacco.md'
    Desc   = 'SACCO and microfinance management for Ugandan cooperatives, built on Apache Fineract.'
    Topics = 'sacco-management,microfinance,core-banking,uganda,fintech,mobile-money,apache-fineract,mifos-x,loan-management,open-source'
    Notice = "- Apache Fineract - https://github.com/apache/fineract - Apache License 2.0`n- Mifos X - https://github.com/openMF/web-app - Mozilla Public License 2.0"
  },
  @{
    Name   = 'tfast-pos'
    Doc    = 'docs/02-tfast-pos.md'
    Desc   = 'Retail point of sale for Ugandan shops with EFRIS and mobile money, built on OSPOS.'
    Topics = 'point-of-sale,retail,efris,uganda,inventory,barcode,offline-first,open-source'
    Notice = "- Open Source Point of Sale (OSPOS) - https://github.com/opensourcepos/opensourcepos - MIT (with required footer signature)"
  },
  @{
    Name   = 'tfast-flashing-suite'
    Doc    = 'docs/03-tfast-flashing-suite.md'
    Desc   = 'Phone repair toolkit for workshops: flashing, unbricking and backups, built on mtkclient.'
    Topics = 'phone-repair,mtk,flashing-tool,android,uganda,mobile-repair,windows-tool,open-source'
    Notice = "- mtkclient - https://github.com/bkerler/mtkclient - MIT License`n- scrcpy - https://github.com/Genymobile/scrcpy - Apache License 2.0"
  },
  @{
    Name   = 'tfast-school'
    Doc    = 'docs/04-tfast-school.md'
    Desc   = 'School management platform for Ugandan schools with mobile money fees, built on Gibbon.'
    Topics = 'school-management,education,uganda,fees-management,attendance,parent-portal,mobile-money,open-source'
    Notice = "- Gibbon - https://github.com/GibbonEdu/core - GNU GPL v3.0"
  },
  @{
    Name   = 'tfast-store'
    Doc    = 'docs/05-tfast-store.md'
    Desc   = 'E-commerce for Ugandan shops with MTN MoMo and Airtel Money, built on Medusa.'
    Topics = 'ecommerce,medusa,mobile-money,mtn-momo,airtel-money,uganda,headless-commerce,open-source'
    Notice = "- Medusa - https://github.com/medusajs/medusa - MIT License (core)"
  },
  @{
    Name   = 'tfast-cyber'
    Doc    = 'docs/06-tfast-cyber.md'
    Desc   = 'Security monitoring and awareness services for Ugandan businesses, built on Wazuh and GoPhish.'
    Topics = 'cybersecurity,siem,wazuh,security-awareness,uganda,compliance,open-source'
    Notice = "- Wazuh - https://github.com/wazuh/wazuh - GNU GPL v2.0`n- GoPhish - https://github.com/gophish/gophish - MIT License"
  },
  @{
    Name   = 'tfast-clinic'
    Doc    = 'docs/07-tfast-clinic.md'
    Desc   = 'Clinic and hospital records for Ugandan health centres, built on OpenMRS.'
    Topics = 'healthcare,emr,clinic-management,uganda,patient-records,hmis,open-source'
    Notice = "- OpenMRS - https://github.com/openmrs/openmrs-core - Mozilla Public License 2.0"
  },
  @{
    Name   = 'tfast-church'
    Doc    = 'docs/08-tfast-church.md'
    Desc   = 'Church management with mobile money giving and SMS, built on ChurchCRM.'
    Topics = 'church-management,crm,giving,uganda,sms,mobile-money,open-source'
    Notice = "- ChurchCRM - https://github.com/ChurchCRM/CRM - MIT License"
  },
  @{
    Name   = 'tfast-hr'
    Doc    = 'docs/09-tfast-hr.md'
    Desc   = 'Payroll and HR with NSSF and PAYE for Ugandan SMEs, built on Krayin.'
    Topics = 'hr,payroll,nssf,paye,uganda,employee-management,open-source'
    Notice = "- Krayin - https://github.com/krayin/laravel-crm - MIT License"
  },
  @{
    Name   = 'tfast-site-builder'
    Doc    = 'docs/10-tfast-site-builder.md'
    Desc   = 'Drag-and-drop website builder for Ugandan small businesses, built on GrapesJS.'
    Topics = 'website-builder,no-code,grapesjs,uganda,small-business,open-source'
    Notice = "- GrapesJS - https://github.com/GrapesJS/grapesjs - BSD 3-Clause License"
  }
)

$utf8 = New-Object System.Text.UTF8Encoding($false)

foreach ($p in $products) {
  Write-Host "=== Creating $($p.Name) ==="
  $dest = Join-Path $root "repos/$($p.Name)"
  New-Item -ItemType Directory -Force -Path $dest | Out-Null

  # README from the spec, with the repo line updated
  $readme = [System.IO.File]::ReadAllText((Join-Path $root $p.Doc))
  $readme = $readme.Replace("**Planned repo:** ``tfastdigital/$($p.Name)``", "**Repository:** https://github.com/tfastdigital/$($p.Name)")
  [System.IO.File]::WriteAllText((Join-Path $dest 'README.md'), $readme, $utf8)

  # LICENSE (our docs are MIT)
  Copy-Item (Join-Path $root 'LICENSE') (Join-Path $dest 'LICENSE') -Force

  # NOTICE crediting upstream
  $notice = "# NOTICE`n`n$($p.Name) is built on the following open-source projects:`n`n$($p.Notice)`n`nAll license terms of the upstream projects apply to their respective code.`nProject names and trademarks belong to their respective owners.`n"
  [System.IO.File]::WriteAllText((Join-Path $dest 'NOTICE.md'), $notice, $utf8)

  Push-Location $dest
  git init | Out-Null
  git add -A
  git -c user.name="Tfast Digital Agency" -c user.email="dev@tfastdigital.com" commit -m "Initial release: $($p.Name) specification" | Out-Null
  git branch -m main
  gh repo create $p.Name --public --source=. --remote=origin --push --description $p.Desc
  gh repo edit "tfastdigital/$($p.Name)" --add-topic $p.Topics | Out-Null
  Pop-Location
  Write-Host "Done: https://github.com/tfastdigital/$($p.Name)"
  Write-Host ""
}

Write-Host "All products processed."
