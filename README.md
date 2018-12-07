# DNS analyser tool
These scripts analyse DNS records for a given domain using Unix *dig* tool. Each script has it's own functionnalities :

- *get_info_serv.sh* : lookup DNS records for given domain and resolver
- *get_info_serv_col.sh* : same tool but print messages in color (use the former if you redirect your data into a file by piping)
- *run_all_domains.sh* : run given domain with a selection of DNS resolvers and create a file with the information collected for each different resolver. Possibility to add an prefix in the filename (by default: eduroam)
