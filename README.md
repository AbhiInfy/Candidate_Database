# Naukri Job Link Agent

Phase 1 keeps only the Naukri scraping flow needed to collect recent job links and store new results in Excel.

## What is included

- `naukri_agent.py` for scraping and Excel output
- `Run_Naukri.bat` for one-click Windows launch
- `requirements.txt` with the minimal Python dependencies

## Setup

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python -m playwright install chromium
```

## Run

Manual login on the first run:

```powershell
python .\naukri_agent.py --login --keyword "Oracle Fusion Application" --pages 3
```

Normal run after the login profile is saved:

```powershell
python .\naukri_agent.py --keyword "Oracle Fusion Application" --pages 3
```

Or use the launcher:

```powershell
.\Run_Naukri.bat
```

The default output file is `naukri_job_links.xlsx`. The script keeps the existing dedupe logic, optional contact lookup, and last-24-hours filtering.
