# Bank Loan Analysis — Power BI & SQL

A collection of sample data, SQL scripts and Power BI reports to explore, analyze and visualize bank loan datasets. This repository provides SQL artifacts to prepare and load data plus Power BI (.pbix) files to build dashboards and perform interactive analysis.

> Quick links: [Docs/](Docs/) • [Data/](Data/) • [SQL/](SQL/) • [PBIX/](PBIX/) • [assets/](assets/)

---

## Table of contents
- [What this project does](#what-this-project-does)
- [Why this project is useful](#why-this-project-is-useful)
- [Repository structure](#repository-structure)
- [Assets / Snapshots](#assets--snapshots)
- [Getting started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Clone the repo](#clone-the-repo)
  - [Prepare the database (quick example)](#prepare-the-database-quick-example)
  - [Open the Power BI report](#open-the-power-bi-report)
  - [Typical workflow](#typical-workflow)
- [Usage examples](#usage-examples)
- [Where to get help](#where-to-get-help)
- [Maintainers & contributing](#maintainers--contributing)
- [License and acknowledgements](#license-and-acknowledgements)

---

## What this project does
This project provides:
- Sample bank loan datasets (in Data/) for analysis and demonstration.
- SQL scripts (in SQL/) to create schema, populate sample tables, and implement common transformations.
- Power BI report files (in PBIX/) that visualize loan metrics, customer segments, default risk, and portfolio KPIs.
- Documentation and assets to help reproduce the analyses and reports.

Goal: make it easy for analysts and developers to reproduce loan analyses, extend reports, and use the SQL artifacts as seeds for production pipelines.

---

## Why this project is useful
- Jumpstart Power BI dashboards that focus on credit and loan portfolio analysis.
- Reusable SQL scripts for ETL, schema design and sample dataset ingestion.
- Good for teaching, prototyping, or validating BI/reporting ideas before integrating into production.
- Clear separation of data, SQL logic and report design so users can adapt pieces independently.

---

## Repository structure
- Docs/ — Project documentation and notes (read first).
- Data/ — Sample datasets (CSV/TSV or raw exports).
- SQL/ — SQL scripts: schema creation, inserts, transformations and sample queries.
- PBIX/ — Power BI Desktop report files (.pbix).
- assets/ — Images and other static assets used in reports or docs.

(All links above are relative and work after cloning the repository.)

---

## Assets / Snapshots
This repository includes preview images of the Power BI report pages to help you quickly see the report layout and key visuals. Open the PBIX files in PBIX/ for the interactive version; these images are static previews stored in assets/.

- Summary page (aggregated metrics and distributions)

![Summary Page Snapshot](assets/Summary%20Page%20Snapshot.png)

- Overview page (high-level KPIs and trends)

![Overview Page Snapshot](assets/Overview%20Page%20Snapshot.png)

- Details page (row-level or drill-through details)

![Details Page Snapshot](assets/Details%20Page%20Snapshot.png)

---

## Getting started

### Prerequisites
- Power BI Desktop (to open .pbix files) — Windows, latest recommended.
- A SQL engine (SQL Server, Azure SQL, PostgreSQL, SQLite, etc.) to run scripts in SQL/.
- Git (to clone this repository).
- Basic familiarity with running SQL scripts and connecting Power BI to databases.

### Clone the repo
```bash
git clone https://github.com/Sahil-1341/bank-loan-analysis-powerbi-sql.git
cd bank-loan-analysis-powerbi-sql
```

### Prepare the database (quick example)
1. Inspect SQL/ to find scripts such as schema.sql and seed-data.sql.
2. Run the scripts against your database engine (examples below).

### Open the Power BI report
1. Launch Power BI Desktop.
2. Open the .pbix file from PBIX/ (e.g., PBIX/Loan-Analysis.pbix).
3. Update the data source settings to point to your running database or direct CSV files in Data/.
4. Refresh the data (Home → Refresh) to populate visuals.

### Typical workflow
1. Run SQL scripts to create and populate the sample database.
2. Open PBIX and ensure data sources point to the database or to Data/ CSV files.
3. Refresh visuals and review dashboards.
4. Modify SQL or PBIX to customize metrics or visuals.
5. Commit changes and open a pull request to contribute improvements.

---

## Usage examples

### Run a SQL script (SQL Server example)
This example uses sqlcmd for SQL Server:
```bash
# Run schema and seed scripts against a local SQL Server instance
sqlcmd -S localhost -U SA -P 'YourPassword' -i SQL/schema.sql
sqlcmd -S localhost -U SA -P 'YourPassword' -i SQL/seed-data.sql
```
Adjust server, credentials and filenames to match the scripts you intend to run.

### Load CSV into SQLite (example)
If you prefer SQLite for quick experimentation:
```bash
# create DB and import CSV (example)
sqlite3 bankloans.db < SQL/schema_sqlite_compatible.sql
# or import a CSV (from Data/) into a table named loans
sqlite3 bankloans.db
sqlite> .mode csv
sqlite> .import Data/loans.csv loans
```
Note: SQL dialect and schema files may need editing to be compatible with your engine.

### Connect Power BI to a local SQL Server database
1. In Power BI Desktop: Home → Get Data → SQL Server.
2. Server: localhost (or your server name). Database: the database you created (e.g., BankLoans).
3. Authentication: choose Windows / Database / Microsoft account as appropriate.
4. Choose the tables or use a custom query to load the transformed views provided in SQL/.

---

## Where to get help
- Start with the repository Docs/: [Docs/](Docs/)
- Open an issue on this repository for bugs, questions or feature requests: Issues → New issue
- For contribution guidance or project conventions, check Docs/ or create an issue titled “How to contribute” if a CONTRIBUTING.md is not present.

---

## Maintainers & contributing
Maintainer: Sahil-1341 (repository owner and primary contact)

Contributing:
- Please open issues for discussion or to report problems.
- Fork the repository, create a feature branch, and open a pull request when ready.
- If a Docs/CONTRIBUTING.md exists, follow those guidelines. If not, use the issue/PR process described above.

We welcome improvements to SQL scripts, report design, documentation and sample data.

---

## License and acknowledgements
- See the repository LICENSE file for license details.
- Acknowledgements: built as an educational/demo repository to show how SQL scripts and Power BI reports can be combined for loan portfolio analysis.

---
