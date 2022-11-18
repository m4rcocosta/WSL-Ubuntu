cd /home/marco/.openshift
rm *
curl -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/openshift-client-linux.tar.gz
tar -xf openshift-client-linux.tar.gz
rm openshift-client-linux.tar.gz
cd
