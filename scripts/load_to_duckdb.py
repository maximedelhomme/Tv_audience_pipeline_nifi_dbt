import os, duckdb, pandas as pd

IN_DIR = os.environ.get("STAGING_DIR", "data/staging")
DB_PATH = os.environ.get("DB_PATH", "warehouse.duckdb")

aud_files = [f for f in os.listdir(IN_DIR) if f.startswith("audience_") and f.endswith(".csv")]
dfs = []
for f in aud_files:
    dfs.append(pd.read_csv(os.path.join(IN_DIR, f), dtype=str))
aud = pd.concat(dfs, ignore_index=True) if dfs else pd.DataFrame(columns=["date","country","channel","program","viewers","loaded_at"])
dim = pd.read_csv(os.path.join(IN_DIR, "dim_channels.csv"), dtype=str)

for col in ["date","country","channel","program","loaded_at"]:
    aud[col] = aud[col].astype("string").str.strip()
aud["viewers"] = pd.to_numeric(aud["viewers"], errors="coerce")
for col in ["country","alias","channel_std"]:
    dim[col] = dim[col].astype("string").str.strip()

con = duckdb.connect(DB_PATH)
con.execute("CREATE SCHEMA IF NOT EXISTS stage")
con.execute("CREATE SCHEMA IF NOT EXISTS marts")
con.execute("DROP TABLE IF EXISTS stage.audience_raw")
con.execute("DROP TABLE IF EXISTS stage.dim_channels_raw")
con.register("aud_df", aud); con.register("dim_df", dim)
con.execute("CREATE TABLE stage.audience_raw AS SELECT * FROM aud_df")
con.execute("CREATE TABLE stage.dim_channels_raw AS SELECT * FROM dim_df")
print("Loaded:", len(aud), "audience rows;", len(dim), "dim rows")