# gp-metrics-for-grafana

To install and run Grafana for Greenplum, follow the following steps:

1. Connect into Greenplum master instance, `git clone` this repo, and change into the new directory created (`gp-grafana`).
2. Edit the `hostfile_allhosts`, and `hostfile_segonly` files; make sure you add only one host per line. `hostfile_allhosts` file should have all master and segment instances hostnames (or IP's), while `hostfile_segonly` only all segment instances hostnames.
3. Run `./download-go-1.13.4.sh` file, followed by `./install-go-1.13.4.sh` file.
4. Run `./download-orgalorg.sh` file, followed by `./install-orgalorg.sh` file.
5. Run `./download-influxdb-1.7.9.sh` file, followed by `./install-influxdb-1.7.9.sh` file.
6. Run `./download-grafana-6.4.3-1.sh` file, followed by `./install-grafana-6.4.3-1.sh` file.
7. Run `./download-telegraf-1.12.4-1.sh` file, followed by `./install-telegraf-1.12.4-1.sh` file.
8. Make sure ports 3000, 8086 are open and allow connections, on the Greenplum master instance for Grafana GUI and InfluxDB to run properly.
9. Run `./start-influx.sh` to start the InfluxDB on master host.
10. Run `./start-grafana.sh` to start the Grafana Server and GUI on master host.
11. Run `./start-telegraf.sh` to start the Telegrag agent on all hosts.
12. Navigate to `http://<master host>:3000` and connect into Grafana GUI (admin/admin)
13. Create a data source connection for InfluxDB on Grafana
14. Create a data source connection for Greenplum Command Center database on Grafana (`gpmon`)
15. Create a data source connection for Greenplum database on Grafana (`gpadmin`)
16. Connect to the Greenplum database (using `psql` or any similar tool), and run the following SQL commands:
```sql
ALTER DATABASE gpperfmon SET search_path TO public,gpmetrics;
```
```sql
CREATE EXTERNAL WEB TABLE gpstate ( 
    output TEXT)
EXECUTE '/usr/local/greenplum-db/bin/gpstate -e' ON MASTER 
FORMAT 'TEXT';
```
``` sql
CREATE EXTERNAL WEB TABLE gpcc_version ( 
    version TEXT)
EXECUTE 'source /usr/local/greenplum-cc-web/gpcc_path.sh; /usr/local/greenplum-cc-web/bin/gpcc --version | awk ''{print $7}''' ON MASTER 
FORMAT 'TEXT';
```
17. Import the `gpcc/gpcc_cluster_metrics.json`, `gpcc/gpcc_dashboard.json`, and `gpcc/gpcc_host_metrics_*.json` files as new dashboards on Grafana.
