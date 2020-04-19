# Switch information
# id  | name                    | dpid
# s21 | internalSwitch          | 0000000000000015
# s22 | cloudProviderSwitch     | 0000000000000016
# s31 | financeSwitch           | 000000000000001f
# s32 | sportsAndSocialSwitch   | 0000000000000020
# s33 | salesAndMarketingSwitch | 0000000000000021
# s34 | publicSwitch            | 0000000000000022 

# Enable the firewall
curl -X PUT http://localhost:8080/firewall/module/enable/0000000000000015 | json_pp
curl -X PUT http://localhost:8080/firewall/module/enable/0000000000000016 | json_pp
curl -X PUT http://localhost:8080/firewall/module/enable/0000000000000020 | json_pp
curl -X PUT http://localhost:8080/firewall/module/enable/0000000000000021 | json_pp
curl -X PUT http://localhost:8080/firewall/module/enable/0000000000000022 | json_pp
curl -X PUT http://localhost:8080/firewall/module/enable/000000000000001f | json_pp

# Add the firewall rules

# Rules for protecting Finance servers - only allow Finance Dept clients
curl -X POST -d '{"nw_src": "10.1.0.1/32", "nw_dst": "10.4.0.1/32"}' http://localhost:8080/firewall/rules/0000000000000015 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.1/32", "nw_dst": "10.1.0.1/32"}' http://localhost:8080/firewall/rules/0000000000000015 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.1/32", "nw_dst": "10.4.0.1/32"}' http://localhost:8080/firewall/rules/000000000000001f | json_pp
curl -X POST -d '{"nw_src": "10.4.0.1/32", "nw_dst": "10.1.0.1/32"}' http://localhost:8080/firewall/rules/000000000000001f | json_pp
curl -X POST -d '{"nw_src": "10.1.0.1/32", "nw_dst": "10.4.0.2/32"}' http://localhost:8080/firewall/rules/0000000000000015 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.2/32", "nw_dst": "10.1.0.1/32"}' http://localhost:8080/firewall/rules/0000000000000015 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.1/32", "nw_dst": "10.4.0.2/32"}' http://localhost:8080/firewall/rules/000000000000001f | json_pp
curl -X POST -d '{"nw_src": "10.4.0.2/32", "nw_dst": "10.1.0.1/32"}' http://localhost:8080/firewall/rules/000000000000001f | json_pp

# Rules for protecting Sports & Social and Sales & Marketing servers - only allow Finance and S&M Dept clients
curl -X POST -d '{"nw_src": "10.1.0.0/30", "nw_dst": "10.4.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000015 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.0/24", "nw_dst": "10.1.0.0/30"}' http://localhost:8080/firewall/rules/0000000000000015 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.0/30", "nw_dst": "10.4.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000020 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.0/24", "nw_dst": "10.1.0.0/30"}' http://localhost:8080/firewall/rules/0000000000000020 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.0/30", "nw_dst": "10.4.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000021 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.0/24", "nw_dst": "10.1.0.0/30"}' http://localhost:8080/firewall/rules/0000000000000021 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.0/30", "nw_dst": "10.4.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000022 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.0/24", "nw_dst": "10.1.0.0/30"}' http://localhost:8080/firewall/rules/0000000000000022 | json_pp

# Rules for only allowing all others to access public servers
curl -X POST -d '{"nw_src": "10.1.0.0/24", "nw_dst": "10.4.0.7/32"}' http://localhost:8080/firewall/rules/0000000000000016 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.7/32", "nw_dst": "10.1.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000016 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.0/24", "nw_dst": "10.4.0.7/32"}' http://localhost:8080/firewall/rules/0000000000000022 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.7/32", "nw_dst": "10.1.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000022 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.0/24", "nw_dst": "10.4.0.8/32"}' http://localhost:8080/firewall/rules/0000000000000016 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.8/32", "nw_dst": "10.1.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000016 | json_pp
curl -X POST -d '{"nw_src": "10.1.0.0/24", "nw_dst": "10.4.0.8/32"}' http://localhost:8080/firewall/rules/0000000000000022 | json_pp
curl -X POST -d '{"nw_src": "10.4.0.8/32", "nw_dst": "10.1.0.0/24"}' http://localhost:8080/firewall/rules/0000000000000022 | json_pp
