# Candidate_Database - Naukri Job Link Agent

This repository is now a standalone Naukri scraper focused on one job:
collecting recent job links and writing unique results to an Excel file.

## Current scope

- Standalone project with no dependency on other repositories
- Scrapes Naukri search results for a keyword
- Filters to recent postings using age text on job cards
- Optionally opens job detail pages to extract email/contact number
- Deduplicates entries by normalized job link
- Saves output to an Excel workbook

## Project files

- naukri_agent.py: Main scraper and Excel writer
- Run_Naukri.bat: Windows launcher (uses .venv Python when available)
- requirements.txt: Python dependencies
- naukri_browser_profile/: Persistent Chromium profile for saved login session
- naukri_job_links.xlsx: Default output file

## Requirements

- Windows PowerShell or Command Prompt
- Python 3.10+ (tested with Python 3.13)
- Internet access
- Naukri account for authenticated browsing experience

## Setup

1. Create and activate virtual environment

	```powershell
	python -m venv .venv
	.\.venv\Scripts\Activate.ps1
	```

2. Install dependencies

	```powershell
	pip install -r requirements.txt
	```

3. Install Playwright browser

	```powershell
	python -m playwright install chromium
	```

## Run

### First run with manual login

Use this once to save your Naukri login into the local browser profile:

```powershell
python .\naukri_agent.py --login --keyword "Oracle Fusion Application" --pages 3
```

### Normal run

```powershell
python .\naukri_agent.py --keyword "Oracle Fusion Application" --pages 3
```

### Run with launcher (recommended on Windows)

```powershell
.\Run_Naukri.bat --keyword "Oracle Fusion Application" --pages 3
```

## Verified working run

The following command was executed successfully:

```powershell
.\Run_Naukri.bat --keyword "Oracle Fusion Application" --pages 1 --max-age-hours 24 --skip-contact-details
```

Observed result:

- Scanned matching recent jobs: 4
- New links added: 2
- Excel file updated: naukri_job_links.xlsx

## Command options

naukri_agent.py supports these key arguments:

- --keyword: Search text (default: Oracle Fusion Application)
- --output: Excel file path (default: naukri_job_links.xlsx)
- --profile-dir: Browser profile directory (default: naukri_browser_profile)
- --max-age-hours: Keep jobs posted within N hours (default: 24)
- --pages: Number of result pages to scan (default: 3)
- --delay: Delay between pages in seconds (default: 2.0)
- --login: Pause for manual login before scraping
- --skip-contact-details: Skip opening each job page for email/phone extraction

## Output format

Excel sheet name: Job Links

Columns:

1. Technology
2. Job Title
3. Company
4. Posted
5. Email
6. Contact Number
7. Job Link
8. Collected At

## Notes

- Deduplication is based on normalized job URL (query/fragment stripped).
- Existing workbooks are auto-aligned to the latest headers.
- If no jobs are found on a scanned page, the run stops early.

## Troubleshooting

- Browser not opening: run python -m playwright install chromium again.
- Login not retained: delete/backup naukri_browser_profile and run with --login.
- Permission errors writing Excel: close naukri_job_links.xlsx before running.
- Slow runs: add --skip-contact-details to avoid opening every job detail page.
