# TV Audience Mini Pipeline (NiFi + dbt + DuckDB)

But : mini-projet 2h30 max pour montrer un flux **NiFi** qui dépose des fichiers, puis déclenche **dbt** (DuckDB) pour produire des tables d'audience propres + un top 10 par pays/date.

## Vue d'ensemble (simple)
1. **NiFi** prend des CSV depuis `data/inbox/` et les copie dans `data/staging/`.
2. NiFi lance `scripts/load_to_duckdb.py` (charge le staging dans `warehouse.duckdb`).
3. NiFi lance **dbt** : `dbt run` puis `dbt test` (DuckDB).
4. Si OK, NiFi lance `scripts/export_results.py` (écrit les CSV finaux dans `exports/`).

## Structure du repo
data/
  inbox/
  staging/
dbt_project/
  models/
    staging/
    marts/
exports/
scripts/
warehouse.duckdb  (créée au 1er run)

## Prérequis locaux
- Python 3.10+
- `pip install duckdb pandas dbt-core dbt-duckdb`
- Créer `~/.dbt/profiles.yml` :
tv_audience_profile:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: warehouse.duckdb

## Exécution rapide (sans NiFi)
cp -r data/inbox/* data/staging/
python scripts/load_to_duckdb.py
cd dbt_project && dbt run && dbt test && cd ..
python scripts/export_results.py
# Résultats : exports/marts.fact_audience.csv, exports/marts.kpi_top10.csv

## NiFi (démo simple)
1) GetFile  -> ./data/inbox
2) PutFile  -> ./data/staging
3) ExecuteProcess -> python scripts/load_to_duckdb.py
4) ExecuteProcess -> dbt run   (Working Dir: ./dbt_project)
5) ExecuteProcess -> dbt test  (Working Dir: ./dbt_project)
6) ExecuteProcess -> python scripts/export_results.py

Routes d'erreur -> email/webhook d'alerte.
