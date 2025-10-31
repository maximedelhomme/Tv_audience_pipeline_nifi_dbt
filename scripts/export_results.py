import os
import duckdb
import pandas as pd

DB_PATH = os.environ.get("DB_PATH", "warehouse.duckdb")
OUT_DIR = os.environ.get("OUT_DIR", "exports")
os.makedirs(OUT_DIR, exist_ok=True)

con = duckdb.connect(DB_PATH)

# tables cibles : schéma dbt-duckdb = main_<schema_config>
tables = ["main_marts.fact_audience", "main_marts.kpi_top10"]

for tbl in tables:
    try:
        df = con.execute(f"SELECT * FROM {tbl}").df()
        out = os.path.join(OUT_DIR, tbl.replace(".", "_") + ".csv")
        df.to_csv(out, index=False)
        print("Exported", out, len(df))
    except Exception as e:
        print("Skip", tbl, e)
