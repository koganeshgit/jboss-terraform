echo "**********************************************************">>output.txt
echo "OS LEVEL PARAMETERS">>output.txt
echo "**********************************************************">>output.txt
for i in ansible_system ansible_all_ipv4_addresses ansible_all_ipv6_addresses ansible_os_family ansible_architecture ansible_bios_version ansible_distribution ansible_distribution_version ansible_processor_cores ansible_processor_count ansible_processor_vcpus ansible_python_version ansible_swapfree_mb ansible_swaptotal_mb ansible_system_vendor ansible_uptime_seconds ansible_user_dir ansible_user_gecos ansible_user_gid ansible_user_id ansible_user_shell ansible_user_uid ansible_userspace_architecture
do
ansible $1 -m setup -a "filter=$i" -i $2 -u $3 --private-key $4|grep -i $i|sed 's/"/ /gi'|awk '{print $1 " = " $3}'  >> output.txt
done
echo "**********************************************************">>output.txt
echo "LIST OF SERVICES INSTALLED">>output.txt
echo "**********************************************************">>output.txt
for j in jboss.service
do
ansible $1 -m service_facts -i $2 -u $3 --private-key $4| egrep -A 3 "$j" >> output.txt
done
#echo "**********************************************************">>output.txt
#echo "LIST OF INSTALLED SERVICE  VERSIONS">>output.txt
#echo "**********************************************************">>output.txt
#ansible $1 -m command -a "jboss -version" -i $2 -u $3 --private-key $4|sed -n '2p'>>output.txt
