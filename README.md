# gp-metrics-for-grafana

### Requirements
- Pivotal Greenplum Database
- Pivotal Greenplum Database Command Center
- Grafana Server
- InfluxDB (optional)
- Telegrag Agent (optional)

### How to install

1. Connect into Greenplum master instance, `git clone` this repo, and change into the new directory created (`gp-grafana`).
2. Edit the `hostfile_allhosts`, and `hostfile_segonly` files; make sure you add only one host per line. `hostfile_allhosts` file should have all master and segment instances hostnames (or IP's), while `hostfile_segonly` only all segment instances hostnames.
3. Run `./download-grafana-6.4.3-1.sh` file, followed by `./install-grafana-6.4.3-1.sh` file.
4. (Optional) Run `./download-go-1.13.4.sh` file, followed by `./install-go-1.13.4.sh` file. 
5. (Optional) Run `./download-orgalorg.sh` file, followed by `./install-orgalorg.sh` file.
6. (Optional) Run `./download-influxdb-1.7.9.sh` file, followed by `./install-influxdb-1.7.9.sh` file.
7. (Optional) Run `./download-telegraf-1.12.4-1.sh` file, followed by `./install-telegraf-1.12.4-1.sh` file.
8. Make sure ports 3000, 8086 (Optional) are open and allow connections, on the Greenplum master instance for Grafana GUI and InfluxDB respectively, to run properly.
9. Run `./start-grafana.sh` to start the Grafana Server and GUI on master host.
10. (Optional) Run `./start-influx.sh` to start the InfluxDB on master host. 
11. (Optional) Run `./start-telegraf.sh` to start the Telegrag agent on all hosts.
12. Navigate to `http://<master host>:3000` and connect into Grafana GUI (admin/admin)
13. Create a data source connection for Greenplum Command Center database on Grafana (`gpmon`)
14. Create a data source connection for Greenplum database on Grafana (`gpadmin`)
15. (Optional) Create a data source connection for InfluxDB on Grafana
16. Connect to the Greenplum database (using `psql` or any similar tool), and run the following SQL commands:
```sql
ALTER DATABASE gpperfmon SET search_path TO public,gpmetrics;
```
```sql
DROP EXTERNAL WEB TABLE IF EXISTS gpstate;

CREATE EXTERNAL WEB TABLE gpstate ( 
    output TEXT)
EXECUTE '/usr/local/greenplum-db/bin/gpstate -e' ON MASTER 
FORMAT 'TEXT';
```
``` sql
DROP EXTERNAL WEB TABLE IF EXISTS gpcc_version;

CREATE EXTERNAL WEB TABLE gpcc_version ( 
    version TEXT)
EXECUTE 'source /usr/local/greenplum-cc-web/gpcc_path.sh; /usr/local/greenplum-cc-web/bin/gpcc --version | awk ''{print $7}''' ON MASTER 
FORMAT 'TEXT';
```
``` sql
DROP EXTERNAL WEB TABLE IF EXISTS gpstate_replication_mode;

CREATE EXTERNAL WEB TABLE gpstate_replication_mode ( 
    Mirror TEXT,
    Datadir TEXT, 
    Port INTEGER, 
    Status TEXT, 
    DataStatus TEXT)
EXECUTE '/usr/local/greenplum-db/bin/gpstate -m | grep -E -- ''Synchronized|Resynchronizing|Change Tracking'' | awk {''print $3 "|" $4 "|" $5 "|" $6 "|" $7''}' ON MASTER 
FORMAT 'TEXT' (DELIMITER '|');
```
``` sql
DROP EXTERNAL WEB TABLE IF EXISTS gpstate_summary;

CREATE EXTERNAL WEB TABLE gpstate_summary (
    descr TEXT,
    value TEXT)
EXECUTE 'gpstate | grep -E -- ''^.*\[INFO\]:-\s*(.*)=.*$'' | awk -F ''[[:space:]][[:space:]]+'' ''{print $2, $3}'' | awk -F ''='' ''{print $1"|"$2}''' ON MASTER
FORMAT 'TEXT' (DELIMITER '|');
```
```sql
CREATE OR REPLACE VIEW gpcc_disk_history_view AS
SELECT ctime, gdh.hostname, gdh.filesystem, total_bytes, bytes_used, bytes_available, hosttype
FROM gpcc_disk_history gdh
JOIN gpmetrics.gp_data_dirs gdd
ON gdh.hostname = gdd.tmphostname
    AND gdh.data_dirs @> STRING_TO_ARRAY(gdd.datadir, '')::TEXT[]
WHERE
    ARRAY_UPPER(data_dirs, 1) IS NOT NULL
GROUP BY 1, 2, 3, 4, 5, 6, 7;
```
17. Import the `gpcc/gpcc_dashboard.json`, and `gpcc/gpcc_*.json` files as new dashboards on Grafana. The `gpcc/*` dashboard components require Grafana, Greenplum Database and Greenplum Database Command Center services to be valid and working in order to run properly but the `Uptime (Master)` component, which additionally requires, the InfluxDB and Telegraf services.
18. (Optional) Import the `gp-cluster/gpcluster-dashboard.json`, and `host-dashboard_rev2/host-dashboard_rev2.json` file as new dashboards on Grafana. Those two dashboards, require Grafana, Greenplum Database, Greenplum Database Command Center and also InfluxDB, Telegraf services to be valid and working, to run properly.

### Screenshots
- `host-dashboard_rev2/host-dashboard_rev2.json` (Master View)
![Image of gp-cluster/gpcluster-dashboard.json](https://github.com/cantzakas/gp-grafana/blob/master/host-dashboard_rev2/host-dashboard_rev2-master.jpg)
- `host-dashboard_rev2/host-dashboard_rev2.json` (Segment View)
![Image of gp-cluster/gpcluster-dashboard.json](https://github.com/cantzakas/gp-grafana/blob/master/host-dashboard_rev2/host-dashboard_rev2-segment.jpg)
- `gpcc/gpcc_cluster_metrics.json`
![Image of gpcc/gpcc_cluster_metrics.json](https://github.com/cantzakas/gp-grafana/blob/master/gpcc/gpcc_cluster_metrics.jpg)
- `gpcc/gpcc_dashboard.json`
![Image of gpcc/gpcc_dashboard.json](https://github.com/cantzakas/gp-grafana/blob/master/gpcc/gpcc_dashboard.jpg)
- `gpcc/gpcc_host_metrics.json`
![Image of gpcc/gpcc_host_metrics.json](https://github.com/cantzakas/gp-grafana/blob/master/gpcc/gpcc_host_metrics.jpg)
- `gpcc/gpcc_segment_status.json`
![Image of gpcc/gpcc_segment_status.json](https://github.com/cantzakas/gp-grafana/blob/master/gpcc/gpcc_segment_status.jpg)
- `gpcc/gpcc_storage_status.json`
![Image of gpcc/gpcc_storage_status.json](https://github.com/cantzakas/gp-grafana/blob/master/gpcc/gpcc_storage_status.jpg)
